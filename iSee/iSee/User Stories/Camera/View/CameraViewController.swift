//
//  CameraViewController.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit
import AVFoundation

final class CameraViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var previewLayer: UIView!
    @IBOutlet private weak var takePhotoButton: UIButton!

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

}

// MARK: - Actions

private extension CameraViewController {

    @IBAction func takePhotoAction(_ sender: Any) {
    }

}
