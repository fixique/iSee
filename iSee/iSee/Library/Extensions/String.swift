//
//  String.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
