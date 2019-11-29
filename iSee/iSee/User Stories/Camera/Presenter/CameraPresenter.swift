//
//  CameraPresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

final class CameraPresenter: CameraViewOutput, CameraModuleInput {

    // MARK: - Properties

    weak var view: CameraViewInput?
    var router: CameraRouterInput?
    var output: CameraModuleOutput?

    // MARK: - CameraViewOutput

    // MARK: - CameraModuleInput

}
