//
//  CameraViewOutput.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

protocol CameraViewOutput {
    func viewLoaded()
    func predictByImage(_ image: UIImage?)
}
