//
//  LooksViewInput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

protocol LooksViewInput: class {
    func setupInitialState()
    func update(with items: [LooksCellModel])
}
