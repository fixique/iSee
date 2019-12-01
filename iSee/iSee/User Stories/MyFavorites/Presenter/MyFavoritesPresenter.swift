//
//  MyFavoritesPresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

final class MyFavoritesPresenter {

    // MARK: - Properties

    weak var view: MyFavoritesViewInput?
    var router: MyFavoritesRouterInput?
    var output: MyFavoritesModuleOutput?

}

// MARK: - MyFavoritesViewOutput

extension MyFavoritesPresenter: MyFavoritesViewOutput {

    func viewLoaded() {
        let favorites = DataStorage.shared.getFavorites()
        view?.setupInitialState(with: favorites)
    }

}

// MARK: - MyFavoritesModuleInput

extension MyFavoritesPresenter: MyFavoritesModuleInput {}
