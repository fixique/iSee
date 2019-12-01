//
//  LooksPresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class LooksPresenter {

    // MARK: - Properties

    weak var view: LooksViewInput?
    var router: LooksRouterInput?
    var output: LooksModuleOutput?
}

// MARK: - LooksViewOutput

extension LooksPresenter: LooksViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
        view?.update(with: configureData())
    }

}

// MARK: - LooksModuleInput

extension LooksPresenter: LooksModuleInput {
}

// MARK: - Help Methods

private extension LooksPresenter {

    func configureData() -> [LooksCellModel] {
        var models: [LooksCellModel] = []
        models.append(LooksCellModel(itemImage: UIImage(asset: Asset.image1),
                                     profileImage: UIImage(asset: Asset.rectangle33),
                                     name: "Floral dressess",
                                     profileUrl: "masha_fox",
                                     likesCount: "345"))
        models.append(LooksCellModel(itemImage: UIImage(asset: Asset.image2),
                                     profileImage: UIImage(asset: Asset.img1),
                                     name: "Main Orange",
                                     profileUrl: "Orange_lovers",
                                     likesCount: "3400"))
        models.append(LooksCellModel(itemImage: UIImage(asset: Asset.image3),
                                     profileImage: UIImage(asset: Asset.img2),
                                     name: "Flowers Everywere",
                                     profileUrl: "insta_loay",
                                     likesCount: "6052"))
        models.append(LooksCellModel(itemImage: UIImage(asset: Asset.image4),
                                     profileImage: UIImage(asset: Asset.img3),
                                     name: "Trousers Cool",
                                     profileUrl: "New_Bloger",
                                     likesCount: "134"))
        models.append(LooksCellModel(itemImage: UIImage(asset: Asset.image5),
                                     profileImage: UIImage(asset: Asset.img5),
                                     name: "Green Hit",
                                     profileUrl: "hit_girl",
                                     likesCount: "4223"))
        models.append(LooksCellModel(itemImage: UIImage(asset: Asset.image6),
                                     profileImage: UIImage(asset: Asset.img6),
                                     name: "Red Dressess",
                                     profileUrl: "iambloger",
                                     likesCount: "645"))
        return models
    }

}
