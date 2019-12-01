//
//  ClotheItemEntry.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import NodeKit

class ClotheItemViewModel: NSObject, NSCoding {

    let id: String
    let url: String
    let imageUrl: String
    let name: String
    let price: Double
    let source: String
    let position: Int

    init(id: String, url: String, imageUrl: String, name: String, price: Double, source: String, position: Int) {
        self.id = id
        self.url = url
        self.imageUrl = imageUrl
        self.name = name
        self.price = price
        self.source = source
        self.position = position
    }

    init(with entity: ClotheItemEntity) {
        self.id = entity.id
        self.url = entity.url
        self.imageUrl = entity.imageUrl
        self.name = entity.name
        self.price = entity.price
        self.source = entity.source
        self.position = entity.position
    }

    required init(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? String ?? ""
        self.url = aDecoder.decodeObject(forKey: "url") as? String ?? ""
        self.imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String ?? ""
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.price = aDecoder.decodeObject(forKey: "price") as? Double ?? 0.0
        self.source = aDecoder.decodeObject(forKey: "source") as? String ?? ""
        self.position = aDecoder.decodeObject(forKey: "position") as? Int ?? 0
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.url, forKey: "url")
        aCoder.encode(self.imageUrl, forKey: "imageUrl")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.price, forKey: "price")
        aCoder.encode(self.source, forKey: "source")
        aCoder.encode(self.position, forKey: "position")
    }

}

struct ClotheItemEntity {
    let id: String
    let url: String
    let imageUrl: String
    let name: String
    let price: Double
    let source: String
    let position: Int

    init(id: String, url: String, imageUrl: String, name: String, price: Double, source: String, position: Int) {
        self.id = id
        self.url = url
        self.imageUrl = imageUrl
        self.name = name
        self.price = price
        self.source = source
        self.position = position
    }

    init(with viewModel: ClotheItemViewModel) {
        self.id = viewModel.id
        self.url = viewModel.url
        self.imageUrl = viewModel.imageUrl
        self.name = viewModel.name
        self.price = viewModel.price
        self.source = viewModel.source
        self.position = viewModel.position
    }
}

// MARK: - DTOConvertible

extension ClotheItemEntity: DTOConvertible {

    typealias DTO = ClotheItemEntry

    static func from(dto model: ClotheItemEntry) throws -> ClotheItemEntity {
        return .init(id: model.id,
                     url: model.url,
                     imageUrl: model.image_url,
                     name: model.name,
                     price: model.price,
                     source: model.source,
                     position: model.position)
    }

    func toDTO() throws -> ClotheItemEntry {
        return ClotheItemEntry(id: id, url: url, image_url: imageUrl, name: name, price: price, source: source, position: position)
    }
}
