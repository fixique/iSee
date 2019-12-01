//
//  LooksModuleConfigurator.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class LooksModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: LooksModuleOutput? = nil) -> LooksViewController {
        guard let view = UIStoryboard(name: String(describing: LooksViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? LooksViewController else {
            fatalError("Can't load LooksViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = LooksPresenter()
        let router = LooksRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
