//
//  PredictedRouterInput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

protocol PredictedRouterInput {

    func close()

    func openCollection(_ image: UIImage, category: String)
}
