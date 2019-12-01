//
//  СlotheItemEntry.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import NodeKit

struct ClotheItemEntry: Codable {
    let id: String
    let url: String
    let image_url: String
    let name: String
    let price: Double
    let source: String
    let position: Int
}

// MARK: - RawMappable

extension ClotheItemEntry: RawMappable {
    typealias Raw = Json
}
