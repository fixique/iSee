//
//  CollectionViewInput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

protocol CollectionViewInput: StatePresentable {
    func setupInitialState(collectionTitle: String)
    func setupCollection(with collection: [ClotheItemEntity])
}
