//
//  CollectionPresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

final class CollectionPresenter {

    // MARK: - Properties

    weak var view: CollectionViewInput?
    var router: CollectionRouterInput?
    var output: CollectionModuleOutput?

}

// MARK: - CollectionViewOutput

extension CollectionPresenter: CollectionViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}

// MARK: - CollectionModuleInput

extension CollectionPresenter: CollectionModuleInput {}
