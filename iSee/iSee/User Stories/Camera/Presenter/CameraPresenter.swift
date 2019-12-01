//
//  CameraPresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class CameraPresenter {

    // MARK: - Properties

    weak var view: CameraViewInput?
    var router: CameraRouterInput?
    var output: CameraModuleOutput?

}

// MARK: - CameraViewOutput

extension CameraPresenter: CameraViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

    func predictByImage(_ image: UIImage?) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let base64String = image?.toBase64() ?? ""
            SeeService().predict(image64: base64String).onCompleted { boxes in
                guard let image = image else {
                    return
                }
                DispatchQueue.main.async {
                    self?.router?.openPredictedModule(image: image, boxes: boxes, output: self)
                }
            }.onError { error in
                DispatchQueue.main.async {
                    self?.view?.setState(.lensOpen)
                }
            }
        }
    }

    func openFavorites() {
        router?.openFavorites()
    }

    func openWardrobe() {
        router?.openWardrobe(output: self)
    }

    func openLooks() {
        router?.openLooks()
    }

}

// MARK: - PredictedModuleOutput

extension CameraPresenter: PredictedModuleOutput {

    func onClose() {
        view?.setState(.lensOpen)
    }

}

extension CameraPresenter: MyWardrobeModuleOutput {

    func addToWardrobe() {
        view?.setState(.lensOpen)
    }

}

// MARK: - CameraModuleInput

extension CameraPresenter: CameraModuleInput {
}
