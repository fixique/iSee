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

    // MARK: - Initialization

    init(image: UIImage, boxes: [PredictedBoxEntity]) {
        self.image = image
        self.boxes = boxes
    }

}

// MARK: - PredictedViewOutput

extension PredictedPresenter: PredictedViewOutput {

    func viewLoaded() {
        view?.setupInitialState(image: image, boxes: boxes)
    }

    func close() {
        output?.onClose()
        router?.close()
    }

}

// MARK: - PredictedModuleInput

extension PredictedPresenter: PredictedModuleInput {}
