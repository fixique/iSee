//
//  MyFavoritesViewInput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

protocol MyFavoritesViewInput: class {
    func setupInitialState(with items: [ClotheItemEntity])
    func update(with items: [ClotheItemEntity])
}
