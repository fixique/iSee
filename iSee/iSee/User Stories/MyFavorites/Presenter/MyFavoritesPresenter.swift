//
//  MyFavoritesPresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

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

    func onItemSelect(item: ClotheItemEntity) {
        guard let url = URL(string: item.url) else {
            return
        }
        UIApplication.shared.open(url)
    }

    func onFavoriteUnselect(item: ClotheItemEntity) {
        DataStorage.shared.removeFavorites(item)
        let favorites = DataStorage.shared.getFavorites()
        view?.update(with: favorites)
    }

}

// MARK: - MyFavoritesModuleInput

extension MyFavoritesPresenter: MyFavoritesModuleInput {}
