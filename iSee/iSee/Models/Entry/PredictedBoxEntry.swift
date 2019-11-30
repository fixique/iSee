//
//  PredictedBoxEntry.swift
//  iSee
//
//  Created by Vlad on 30.11.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import NodeKit

struct PredictedBoxEntry: Codable {
    let id: Int
    let category: String
    let box: [CGFloat]
    let point: [CGFloat]
}

// MARK: - RawMappable

extension PredictedBoxEntry: RawMappable {
    typealias Raw = Json
}
