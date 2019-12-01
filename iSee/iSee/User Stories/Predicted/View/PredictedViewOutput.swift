//
//  PredictedViewOutput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

protocol PredictedViewOutput {
    func viewLoaded()
    func close()
    func clothesPicked(_ image: UIImage)
}
