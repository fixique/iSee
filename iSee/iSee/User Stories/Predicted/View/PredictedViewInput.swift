//
//  PredictedViewInput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

protocol PredictedViewInput: class {
    func setupInitialState(image: UIImage, boxes: [PredictedBoxEntity], isWardrobe: Bool)
}
