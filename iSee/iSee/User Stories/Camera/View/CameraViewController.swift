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

final class CameraViewController: UIViewController, ModuleTransitionable {

    // MARK: - Enums

    private enum States {
        case `default`
        case lensOpen
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var previewLayer: UIView!
    @IBOutlet private weak var takePhotoButton: ShotButton!
    @IBOutlet private weak var bluredLayer: UIView!
    @IBOutlet private weak var lensButton: CommonButton!
    @IBOutlet private weak var lensAnimationView: AnimationView!
    @IBOutlet private weak var closeStateButton: CommonButton!

    // MARK: - Properties

    var output: CameraViewOutput?

    // MARK: - Private Properties

    private var captureSession: AVCaptureSession?
    private var captureOutput: AVCapturePhotoOutput?
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?

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
        configureLensAction()
        configureCloseStateButton()
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

    // MARK: - Configure Default State

    func setDefaultState() {
        bluredLayer.alpha = 0.0
        closeStateButton.alpha = 1.0
//        lensAnimationView.play { _ in
//            self.lensButton.isHidden = false
//            self.lensAnimationView.isHidden = true
//        }
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        self.takePhotoButton.alpha = 0.0
                        self.bluredLayer.alpha = 1.0
                        self.closeStateButton.alpha = 0.0
                        self.lensAnimationView.alpha = 0.0
        }) { _ in
            self.lensButton.isHidden = false
        }
    }

    func configureBluredView() {
        bluredLayer.addBlur(color: UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 0.1),
                            style: .systemUltraThinMaterialDark)
        bluredLayer.isUserInteractionEnabled = true
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

}

// MARK: - Actions

private extension CameraViewController {

    @IBAction func takePhotoAction(_ sender: Any) {
    }

    @objc
    func lensAction() {
        lensAnimationView.isHidden = false
        lensButton.isHidden = true
        lensAnimationView.alpha = 1.0
        lensAnimationView.play()
        bluredLayer.alpha = 1.0
        takePhotoButton.alpha = 0.0
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        self.takePhotoButton.alpha = 1.0
                        self.bluredLayer.alpha = 0.0
                        self.closeStateButton.alpha = 1.0
        }) { _ in
        }
    }

    @IBAction func closeStateAction(_ sender: Any) {
        setDefaultState()
    }
}
