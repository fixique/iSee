//
//  MyWardrobeViewInput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

protocol MyWardrobeViewInput: class {
    func setupInitialState()
    func update(with items: [WardrobeEntity])
}
