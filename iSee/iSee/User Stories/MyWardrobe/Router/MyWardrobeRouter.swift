//
//  MyWardrobeRouter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class MyWardrobeRouter: MyWardrobeRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - MyWardrobeRouterInput

    func close() {
        view?.dismissView(animated: true, completion: nil)
    }

    func openPredict(with item: WardrobeEntity) {
        let boxes = item.boxes.map({ PredictedBoxEntity(id: $0.id, category: $0.category, box: $0.box, point: $0.point) })
        let predictVc = PredictedModuleConfigurator().configure(image: item.image, boxes: boxes, isWardrobe: true)
        view?.presentModule(predictVc, animated: true, completion: nil)
    }

}
