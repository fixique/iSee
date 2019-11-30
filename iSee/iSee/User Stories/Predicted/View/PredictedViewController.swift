//
//  PredictedViewController.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit
import SurfUtils

final class PredictedViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var closeButton: CommonButton!

    // MARK: - Properties

    var output: PredictedViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - PredictedViewInput

extension PredictedViewController: PredictedViewInput {

    func setupInitialState(image: UIImage, boxes: [PredictedBoxEntity]) {
        configurePreviewImageView(with: image)
        configureCloseButton()
        renderBoxes(boxes: boxes)
        renderPoints(boxes: boxes)
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
            boxView.layer.borderColor = UIColor.red.cgColor
            boxView.layer.borderWidth = 2.0
            view.addSubview(boxView)
        }
    }

    func renderPoints(boxes: [PredictedBoxEntity]) {
        boxes.forEach { box in
            let standartSize = CGSize(width: 1280, height: 720)
            let currentSize = UIScreen.main.bounds.size
            let pointView = PointView(frame: CGRect(x: 0, y: 0, width: 24.0, height: 24.0))
            pointView.center = CGPoint(x: (box.point.x / standartSize.height) * currentSize.width,
                                       y: (box.point.y / standartSize.width) * currentSize.height)
            view.addSubview(pointView)
        }
    }

    func configureBubbleView() {
        
    }

}

// MARK: - Actions

private extension PredictedViewController {

    @IBAction func closeAction(_ sender: Any) {
        output?.close()
    }

}
