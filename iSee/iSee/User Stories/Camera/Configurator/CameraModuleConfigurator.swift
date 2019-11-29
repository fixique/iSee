//
//  CameraModuleConfigurator.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class CameraModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: CameraModuleOutput? = nil) -> CameraViewController {
        guard let view = UIStoryboard(name: String(describing: CameraViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? CameraViewController else {
            fatalError("Can't load CameraViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = CameraPresenter()
        let router = CameraRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
