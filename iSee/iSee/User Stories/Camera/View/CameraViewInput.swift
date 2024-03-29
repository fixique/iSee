//
//  CameraViewInput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

protocol CameraViewInput: class {
    func setupInitialState()
    func setState(_ state: CameraViewController.CameraState)
}
