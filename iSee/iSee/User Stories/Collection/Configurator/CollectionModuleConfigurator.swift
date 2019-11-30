//
//  CollectionModuleConfigurator.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class CollectionModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: CollectionModuleOutput? = nil) -> CollectionViewController {
        guard let view = UIStoryboard(name: String(describing: CollectionViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? CollectionViewController else {
            fatalError("Can't load CollectionViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = CollectionPresenter()
        let router = CollectionRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
