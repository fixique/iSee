//
//  CollectionPresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class CollectionPresenter {

    // MARK: - Properties

    weak var view: CollectionViewInput?
    var router: CollectionRouterInput?
    var output: CollectionModuleOutput?

    // MARK: - Private Properties

    private let cropedImage: UIImage
    private let category: String

    // MARK: - Initialization

    init(cropedImage: UIImage, category: String) {
        self.cropedImage = cropedImage
        self.category = category
    }

}

// MARK: - CollectionViewOutput

extension CollectionPresenter: CollectionViewOutput {

    func viewLoaded() {
        view?.setupInitialState(collectionTitle: category)
        findSimilar()
    }

}

// MARK: - CollectionModuleInput

extension CollectionPresenter: CollectionModuleInput {}

// MARK: - Network

private extension CollectionPresenter {

    func findSimilar() {
        view?.showLoader(style: .black)
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else {
                return
            }
            let base64String = self.cropedImage.toBase64() ?? ""

            SeeService().findSimilar(image64: base64String, category: self.category).onCompleted { _ in

            }.onError { error in
                print("Something whent wrong: \(error.localizedDescription)")
            }.defer {
                DispatchQueue.main.async {
                    self.view?.hideLoader()
                }
            }

        }
    }

}
