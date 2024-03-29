//
//  CameraViewController.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit
import AVFoundation
import SurfUtils
import Lottie
import NVActivityIndicatorView

final class CameraViewController: UIViewController, ModuleTransitionable, StatePresentable {

    // MARK: - Enums

    enum CameraState {
        case `default`
        case lensOpen
        case loadingPreview
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var previewLayer: UIView!
    @IBOutlet private weak var takePhotoButton: ShotButton!
    @IBOutlet private weak var bluredLayer: UIView!
    @IBOutlet private weak var lensButton: CommonButton!
    @IBOutlet private weak var lensAnimationView: AnimationView!
    @IBOutlet private weak var reverseLensAnimationView: AnimationView!
    @IBOutlet private weak var closeStateButton: CommonButton!
    @IBOutlet private weak var backgroundPreviewImage: UIImageView!
    @IBOutlet private weak var myFovarites: CommonButton!
    @IBOutlet private weak var myWardrobe: CommonButton!
    @IBOutlet private weak var looks: CommonButton!
    @IBOutlet private weak var bottomControlsVIew: UIView!
    @IBOutlet private weak var profileButton: UIButton!
    @IBOutlet private weak var alarmButton: UIButton!

    // MARK: - Properties

    var output: CameraViewOutput?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Private Properties

    private var captureSession: AVCaptureSession?
    private var captureOutput: AVCapturePhotoOutput?
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private var previewImage: PreviewImageView = PreviewImageView()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let isRunning = captureSession?.isRunning, !isRunning {
            captureSession?.startRunning()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.videoPreviewLayer?.frame = self.previewLayer.bounds
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        captureSession?.stopRunning()
    }

}

// MARK: - CameraViewInput

extension CameraViewController: CameraViewInput {

    func setupInitialState() {
        configureCaptureSession()
        configureBluredView()
        configureLensButton()
        configureAnimationView()
        configureReverseAnimationView()
        configureLensAction()
        configureCloseStateButton()
        configureTakeShotButton()
        configureBackgroundPreviewImage()
        configureBottomControls()
    }

    func setState(_ state: CameraState) {
        switch state {
        case .default:
            setDefaultState()
        case .lensOpen:
            setLensState()
        case .loadingPreview:
            setLoadingPreviewState()
        }
    }

}

// MARK: - AVCapturePhotoCaptureDelegate

extension CameraViewController: AVCapturePhotoCaptureDelegate {

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else {
            return
        }

        let image = UIImage(data: imageData)
        self.output?.predictByImage(image)
        backgroundPreviewImage.image = image
        previewImage.setImage(image)
    }

}

// MARK: - Configuration

private extension CameraViewController {

    func configureCaptureSession() {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .hd1280x720

        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera],
                                                                      mediaType: AVMediaType.video,
                                                                      position: .back)

        guard let captureDevice = deviceDiscoverySession.devices.first else {
            print("Failed to get the camera device")
            return
        }

        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)

            captureOutput = AVCapturePhotoOutput()
            guard let captureSession = captureSession, let captureOutput = captureOutput else {
                return
            }
            guard captureSession.canAddInput(input), captureSession.canAddOutput(captureOutput) else {
                return
            }
            captureSession.addInput(input)
            captureSession.addOutput(captureOutput)

            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = .resizeAspect
            videoPreviewLayer?.connection?.videoOrientation = .portrait
            guard let videoLayer = videoPreviewLayer else {
                return
            }
            previewLayer.layer.addSublayer(videoLayer)
        } catch {
            print(error)
            return
        }
    }

    func configureLensAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(lensAction))
        bluredLayer.addGestureRecognizer(gesture)
    }

    func configureCloseStateButton() {
        closeStateButton.setImageForAllState(UIImage(asset: Asset.removeCircle), alpha: 0.6)
        closeStateButton.alpha = 0.0
    }

    func configureTakeShotButton() {
        takePhotoButton.addTarget(self, action: #selector(takePhotoAction), for: .touchUpInside)
        takePhotoButton.isUserInteractionEnabled = true
        takePhotoButton.isEnabled = true
        takePhotoButton.alpha = 0.0
    }

    func configureBackgroundPreviewImage() {
        backgroundPreviewImage.contentMode = .scaleAspectFill
        backgroundPreviewImage.isHidden = true
    }

    func configureBottomControls() {
        bottomControlsVIew.backgroundColor = .clear
        myFovarites.setImageForAllState(UIImage(asset: Asset.tab1), alpha: 0.6)
        myWardrobe.setImageForAllState(UIImage(asset: Asset.tab2), alpha: 0.6)
        looks.setImageForAllState(UIImage(asset: Asset.tab3), alpha: 0.6)
    }

    // MARK: - Configure Default State

    func configureBluredView() {
        bluredLayer.addBlur(color: UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 0.1),
                            style: .systemUltraThinMaterialDark)
        bluredLayer.isHidden = false
    }

    func configureLensButton() {
        lensButton.setImageForAllState(UIImage(asset: Asset.lensShutter), alpha: 1.0)
        lensButton.isEnabled = false
        lensButton.isUserInteractionEnabled = true
        lensButton.isHidden = false
    }

    func configureAnimationView() {
        lensAnimationView.backgroundColor = .clear
        lensAnimationView.contentMode = .scaleAspectFit
        lensAnimationView.loopMode = .playOnce
        lensAnimationView.backgroundBehavior = .pauseAndRestore
        lensAnimationView.isHidden = true
    }

    func configureReverseAnimationView() {
        reverseLensAnimationView.backgroundColor = .clear
        reverseLensAnimationView.contentMode = .scaleAspectFit
        reverseLensAnimationView.loopMode = .playOnce
        reverseLensAnimationView.backgroundBehavior = .pauseAndRestore
        reverseLensAnimationView.isHidden = true
    }
}

// MARK: - Actions

private extension CameraViewController {

    @objc
    func takePhotoAction() {
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        captureOutput?.capturePhoto(with: settings, delegate: self)
        setState(.loadingPreview)
    }

    @objc
    func lensAction() {
        setState(.lensOpen)
    }

    @IBAction func closeStateAction(_ sender: Any) {
        setState(.default)
    }

    @IBAction func openFavorites(_ sender: Any) {
        output?.openFavorites()
    }

    @IBAction func openWardrobe(_ sender: Any) {
        output?.openWardrobe()
    }

    @IBAction func openLooks(_ sender: Any) {
        output?.openLooks()
    }

}

// MARK: - State Preparation

private extension CameraViewController {

    func setDefaultState() {
        hideLoader()
        backgroundPreviewImage.isHidden = true
        previewImage.alpha = 0.0
        bluredLayer.isHidden = false
        bluredLayer.alpha = 0.0
        bluredLayer.isUserInteractionEnabled = true
        closeStateButton.alpha = 1.0
        reverseLensAnimationView.isHidden = false
        lensAnimationView.isHidden = true
        bottomControlsVIew.alpha = 0.0
        reverseLensAnimationView.play { [weak self] _ in
            self?.reverseLensAnimationView.isHidden = true
            self?.reverseLensAnimationView.currentProgress = 0.0
            self?.lensButton.isHidden = false
        }
        UIView.animate(withDuration: 0.3,
                       delay: 0.5,
                       options: .curveLinear,
                       animations: {
                        self.bottomControlsVIew.alpha = 1.0
                        self.profileButton.alpha = 1.0
                        self.alarmButton.alpha = 1.0
        }) { _ in
        }
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        self.takePhotoButton.alpha = 0.0
                        self.bluredLayer.alpha = 1.0
                        self.closeStateButton.alpha = 0.0
        }) { _ in
        }
    }

    func setLensState() {
        hideLoader()
        backgroundPreviewImage.isHidden = true
        previewImage.alpha = 0.0
        lensAnimationView.isHidden = false
        lensButton.isHidden = true
        lensAnimationView.alpha = 1.0
        lensAnimationView.currentProgress = 0.0
        lensAnimationView.isHidden = false
        lensAnimationView.play()
        bluredLayer.alpha = 1.0
        bluredLayer.isUserInteractionEnabled = false
        takePhotoButton.alpha = 0.0
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        self.bottomControlsVIew.alpha = 0.0
                        self.profileButton.alpha = 0.0
                        self.alarmButton.alpha = 0.0
                        self.bluredLayer.alpha = 0.0
        }) { _ in
        }
        UIView.animate(withDuration: 0.5,
                       delay: 0.3,
                       options: .curveLinear,
                       animations: {
                        self.takePhotoButton.alpha = 1.0
                        self.closeStateButton.alpha = 1.0
        }) { _ in
        }
    }

    func setLoadingPreviewState() {
        showLoader(style: .white)
        bluredLayer.isHidden = false
        bluredLayer.alpha = 0.0
        bluredLayer.isUserInteractionEnabled = false
        closeStateButton.alpha = 1.0
        backgroundPreviewImage.image = nil
        backgroundPreviewImage.isHidden = false
        configurePreviewImage()
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        self.bottomControlsVIew.alpha = 0.0
                        self.profileButton.alpha = 0.0
                        self.alarmButton.alpha = 0.0
                        self.takePhotoButton.alpha = 0.0
                        self.bluredLayer.alpha = 1.0
                        self.closeStateButton.alpha = 0.0
                        self.lensAnimationView.alpha = 0.0
                        self.previewImage.alpha = 1.0
        })
    }

    func configurePreviewImage() {
        view.addSubview(previewImage)
        previewImage.anchorCenter(to: view, yOffset: 85)
        previewImage.anchorSize(size: CGSize(width: 100, height: 170))
        previewImage.alpha = 0.0
    }

}
