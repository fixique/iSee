//
//  CameraRouterInput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

protocol CameraRouterInput {
    func openPredictedModule(image: UIImage, boxes: [PredictedBoxEntity], output: PredictedModuleOutput?)
    func openFavorites()
    func openWardrobe(output: MyWardrobeModuleOutput)
    func openLooks()
}
