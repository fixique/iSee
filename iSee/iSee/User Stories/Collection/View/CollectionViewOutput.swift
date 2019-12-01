//
//  CollectionViewOutput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

protocol CollectionViewOutput {
    func viewLoaded()
    func onItemSelect(item: ClotheItemEntity)
    func onFavoriteSelect(item: ClotheItemEntity)
    func onFavoriteUnselect(item: ClotheItemEntity)
}
