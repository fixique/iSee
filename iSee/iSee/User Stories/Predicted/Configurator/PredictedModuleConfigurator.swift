//
//  PredictedModuleConfigurator.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class PredictedModuleConfigurator {

    // MARK: - Internal methods

    func configure(image: UIImage, boxes: [PredictedBoxEntity], output: PredictedModuleOutput? = nil) -> PredictedViewController {
        guard let view = UIStoryboard(name: String(describing: PredictedViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? PredictedViewController else {
            fatalError("Can't load PredictedViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = PredictedPresenter(image: image, boxes: boxes)
        let router = PredictedRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter
        view.modalPresentationStyle = .fullScreen

        return view
    }

}
