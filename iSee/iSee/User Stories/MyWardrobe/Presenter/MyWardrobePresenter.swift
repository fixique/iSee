//
//  MyWardrobePresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

final class MyWardrobePresenter {

    // MARK: - Properties

    weak var view: MyWardrobeViewInput?
    var router: MyWardrobeRouterInput?
    var output: MyWardrobeModuleOutput?

}

// MARK: - MyWardrobeViewOutput

extension MyWardrobePresenter: MyWardrobeViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
        let wardrobe = DataStorage.shared.getWardrobe()
        view?.update(with: wardrobe)
    }

    func addToWardrob() {
        router?.close()
        output?.addToWardrobe()
    }

    func openWardrob(with item: WardrobeEntity) {
        router?.openPredict(with: item)
    }

}

// MARK: - MyWardrobeModuleInput

extension MyWardrobePresenter: MyWardrobeModuleInput {
}
