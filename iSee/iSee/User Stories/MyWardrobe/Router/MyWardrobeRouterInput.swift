//
//  MyWardrobeRouterInput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import Foundation

protocol MyWardrobeRouterInput {
    func close()
    func openPredict(with item: WardrobeEntity)
}
