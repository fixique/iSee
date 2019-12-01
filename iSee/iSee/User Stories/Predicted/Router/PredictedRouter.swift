//
//  PredictedRouter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

typealias EmptyClosure = () -> Void

final class PredictedRouter: PredictedRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - PredictedRouterInput

    func close() {
        view?.dismissView(animated: true, completion: nil)
    }

    func openCollection() {
        let collectionVc = CollectionModuleConfigurator().configure()
        view?.presentModule(collectionVc, animated: true, completion: nil)
    }

}
