//
//  MyWardrobeModuleConfigurator.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class MyWardrobeModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: MyWardrobeModuleOutput? = nil) -> MyWardrobeViewController {
        guard let view = UIStoryboard(name: String(describing: MyWardrobeViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? MyWardrobeViewController else {
            fatalError("Can't load MyWardrobeViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = MyWardrobePresenter()
        let router = MyWardrobeRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
