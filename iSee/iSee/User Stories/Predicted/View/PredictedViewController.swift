//
//  PredictedViewController.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit
import SurfUtils
import EasyTipView

final class PredictedViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var closeButton: CommonButton!
    @IBOutlet private weak var saveButton: CommonButton!

    // MARK: - Properties

    var output: PredictedViewOutput?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Private Properties

    private var pointViews: [CommonButton] = []
    private var boxes: [PredictedBoxEntity] = []
    private var redBoxes: [UIView] = []
    private var previewImage: UIImage?

    private var nameTextField: UITextField?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - PredictedViewInput

extension PredictedViewController: PredictedViewInput {

    func setupInitialState(image: UIImage, boxes: [PredictedBoxEntity], isWardrobe: Bool) {
        self.boxes = boxes
        self.previewImage = image
        configurePreviewImageView(with: image)
        configureCloseButton()
        renderBoxes(boxes: boxes)
        renderPoints(boxes: boxes)
        configureSaveToWardrobe()
        if isWardrobe {
            saveButton.isHidden = true
        }
    }

}

// MARK: - Configuration

private extension PredictedViewController {

    func configurePreviewImageView(with image: UIImage) {
        previewImageView.image = image
        previewImageView.contentMode = .scaleAspectFill
    }

    func configureCloseButton() {
        closeButton.setImageForAllState(UIImage(asset: Asset.removeCircle), alpha: 0.6)
    }

    func renderBoxes(boxes: [PredictedBoxEntity]) {
        boxes.forEach { box in
            let standartSize = CGSize(width: 1280, height: 720)
            let currentSize = UIScreen.main.bounds.size

            let boxView = UIView(frame: CGRect(x: (box.box.origin.y / standartSize.width) * currentSize.height,
                                               y: (box.box.origin.x / standartSize.height) * currentSize.width,
                                               width: (box.box.height / standartSize.width) * currentSize.height,
                                               height: (box.box.width / standartSize.height) * currentSize.width))
            boxView.backgroundColor = .clear
            boxView.layer.borderColor = UIColor.clear.cgColor
            boxView.layer.borderWidth = 0.0
            boxView.isUserInteractionEnabled = false
            view.addSubview(boxView)
            redBoxes.append(boxView)
        }
    }

    func renderPoints(boxes: [PredictedBoxEntity]) {
        boxes.forEach { box in
            let standartSize = CGSize(width: 1280, height: 720)
            let currentSize = UIScreen.main.bounds.size
            let pointView = CommonButton(type: .custom)
            pointView.frame = CGRect(x: 0, y: 0, width: 60.0, height: 60.0)
            pointView.setImageForAllState(UIImage(asset: Asset.pointView), alpha: 0.6)
            pointView.tag = box.id
            pointView.center = CGPoint(x: (box.point.x / standartSize.height) * currentSize.width,
                                       y: (box.point.y / standartSize.width) * currentSize.height)
            pointView.addTarget(self, action: #selector(pointSelected(button:)), for: .touchUpInside)
            pointView.addedTouchArea = 40.0
            view.addSubview(pointView)
            pointViews.append(pointView)
        }
    }

    func configureBubbleView(for pointView: UIView, box: PredictedBoxEntity) {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
//        preferences.drawing.foregroundColor = UIColor.whiteColor()
        preferences.drawing.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.bottom
        EasyTipView.show(forView: pointView,
                         withinSuperview: view,
                         text: box.category,
                         preferences: preferences)
    }

    func configureSaveToWardrobe() {
        saveButton.layer.cornerRadius = 24.0
        saveButton.layer.masksToBounds = true
        saveButton.set(backgroundColor: UIColor(red: 0, green: 27.0 / 255.0, blue: 194.0 / 255.0, alpha: 1.0), for: [.normal])
        saveButton.set(backgroundColor: UIColor(red: 0, green: 27.0 / 255.0, blue: 194.0 / 255.0, alpha: 0.6), for: [.selected, .highlighted, .focused])
    }

}

// MARK: - Actions

private extension PredictedViewController {

    @IBAction func closeAction(_ sender: Any) {
        output?.close()
    }

    @objc
    func pointSelected(button: UIButton) {
        let screen = UIScreen.main.bounds
        guard let previewImage = previewImage else {
            return
        }
        guard let image = cropImage(inputImage: previewImage, toRect: redBoxes[button.tag].frame, boxSize: boxes[button.tag].box.size, viewWidth: screen.width, viewHeight: screen.height) else {
            return
        }
        output?.clothesPicked(image, category: boxes[button.tag].category)
    }

    @IBAction func saveToWardrobe(_ sender: Any) {
        let alertController = UIAlertController(title: "Set Description and save", message: nil, preferredStyle: .alert)
        alertController.addTextField { [weak self] textField in
            self?.nameTextField = textField
            textField.placeholder = "Clothes Name"
        }
        let okAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            self?.output?.saveToWardrobe(name: self?.nameTextField?.text ?? "Без названия")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.presentModule(alertController, animated: true, completion: nil)
    }
}

// MARK: - Help Methods

private extension PredictedViewController {

    func cropImage(inputImage: UIImage, toRect cropRect: CGRect, boxSize: CGSize, viewWidth: CGFloat, viewHeight: CGFloat) -> UIImage? {
        let imageViewScale = max(inputImage.size.width / viewWidth,
                                 inputImage.size.height / viewHeight)

        // Scale cropRect to handle images larger than shown-on-screen size
        let cropZone = CGRect(x: cropRect.origin.y * imageViewScale,
                              y: cropRect.origin.x * imageViewScale,
                              width: boxSize.width,
                              height: boxSize.height)

        guard let cgImage = inputImage.cgImage else {
            return nil
        }
        // Perform cropping in Core Graphics
        guard let cutImageRef = cgImage.cropping(to: cropZone) else {
            return nil
        }

        // Return image to UIImage
        let croppedImage: UIImage = UIImage(cgImage: cutImageRef)
        return croppedImage
    }

}
