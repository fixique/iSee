//
//  PredictedBoxEntity.swift
//  iSee
//
//  Created by Vlad on 30.11.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import NodeKit

struct PredictedBoxEntity {
    let id: Int
    let category: String
    let box: CGRect
    let point: CGPoint
}

// MARK: - DTODecodable

extension PredictedBoxEntity: DTODecodable {

    typealias Raw = PredictedBoxEntry

    static func from(dto model: PredictedBoxEntry) throws -> PredictedBoxEntity {
        let boxRect = CGRect(x: model.box[0], y: model.box[1], width: model.box[2], height: model.box[3])
        let point = CGPoint(x: model.point[0], y: model.point[1])
        return .init(id: model.id,
                     category: model.category,
                     box: boxRect,
                     point: point)
    }
}
