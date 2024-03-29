//
//  MyFavoritesViewOutput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

protocol MyFavoritesViewOutput {
    func viewLoaded()
    func onItemSelect(item: ClotheItemEntity)
    func onFavoriteUnselect(item: ClotheItemEntity)
}
