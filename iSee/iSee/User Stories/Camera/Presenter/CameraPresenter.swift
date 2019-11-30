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
        DispatchQueue.global(qos: .background).async {
            let base64String = image?.toBase64() ?? ""
            SeeService().predict(image64: base64String).onCompleted { boxes in
                print("cool")
                boxes.forEach { print("Category: \($0.category)")}
            }.onError { error in
                print("Some went wrong: \(error.localizedDescription)")
            }
        }
    }

}

// MAKR: - CameraModuleInput

extension CameraPresenter: CameraModuleInput {
}
