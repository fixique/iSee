//
//  CameraRouter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class CameraRouter: CameraRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - CameraRouterInput

    func openPredictedModule(image: UIImage, boxes: [PredictedBoxEntity], output: PredictedModuleOutput?) {
        let predictedVc = PredictedModuleConfigurator().configure(image: image, boxes: boxes, output: output)
        view?.presentModule(predictedVc, animated: true, completion: nil)
    }

    func openFavorites() {
        let favoritesVc = MyFavoritesModuleConfigurator().configure()
        view?.presentModule(favoritesVc, animated: true, completion: nil)
    }

    func openWardrobe() {
    }

    func openLooks() {
    }

}
