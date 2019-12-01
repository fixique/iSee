//
//  PredictedPresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class PredictedPresenter {

    // MARK: - Properties

    weak var view: PredictedViewInput?
    var router: PredictedRouterInput?
    var output: PredictedModuleOutput?

    // MARK: - Private Properties

    private let image: UIImage
    private let boxes: [PredictedBoxEntity]
    private let isWardrobe: Bool
    private var isWasSaved = false

    // MARK: - Initialization

    init(image: UIImage, boxes: [PredictedBoxEntity], isWardrobe: Bool) {
        self.image = image
        self.boxes = boxes
        self.isWardrobe = isWardrobe
    }

}

// MARK: - PredictedViewOutput

extension PredictedPresenter: PredictedViewOutput {

    func viewLoaded() {
        view?.setupInitialState(image: image, boxes: boxes, isWardrobe: isWardrobe)
    }

    func close() {
        output?.onClose()
        router?.close()
    }

    func clothesPicked(_ image: UIImage, category: String) {
        router?.openCollection(image, category: category)
    }

    func saveToWardrobe(name: String) {
        guard !isWasSaved else {
            return
        }
        isWasSaved = true
        let wardrobeItem = WardrobeEntity(name: name, image: image, boxes: boxes)
        DataStorage.shared.setWardrobe(item: wardrobeItem)
    }

}

// MARK: - PredictedModuleInput

extension PredictedPresenter: PredictedModuleInput {}
