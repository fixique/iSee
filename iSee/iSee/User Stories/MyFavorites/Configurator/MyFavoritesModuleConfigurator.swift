//
//  MyFavoritesModuleConfigurator.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class MyFavoritesModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: MyFavoritesModuleOutput? = nil) -> MyFavoritesViewController {
        guard let view = UIStoryboard(name: String(describing: MyFavoritesViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? MyFavoritesViewController else {
            fatalError("Can't load MyFavoritesViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = MyFavoritesPresenter()
        let router = MyFavoritesRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
