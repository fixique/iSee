//
//  WardrobeEntity.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import NodeKit

class WardrobeEntity: NSObject, NSCoding {

    let id: String
    let name: String
    let image: UIImage
    let boxes: [WardrobeBox]

    init(name: String, image: UIImage, boxes: [WardrobeBox]) {
        self.id = UUID().uuidString
        self.name = name
        self.image = image
        self.boxes = boxes
    }

    init(name: String, image: UIImage, boxes: [PredictedBoxEntity]) {
        self.id = UUID().uuidString
        self.name = name
        self.image = image
        self.boxes = boxes.map({ WardrobeBox(with: $0) })
    }

    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? String ?? ""
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.image = aDecoder.decodeObject(forKey: "image") as? UIImage ?? UIImage()
        self.boxes = aDecoder.decodeObject(forKey: "boxes") as? [WardrobeBox] ?? []
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.image, forKey: "image")
        aCoder.encode(self.boxes, forKey: "boxes")
    }

}

class WardrobeBox: NSObject, NSCoding {
    let id: Int
    let category: String
    let box: CGRect
    let point: CGPoint

    init(id: Int, category: String, box: CGRect, point: CGPoint) {
        self.id = id
        self.category = category
        self.box = box
        self.point = point
    }

    init(with entity: PredictedBoxEntity) {
        self.id = entity.id
        self.category = entity.category
        self.box = entity.box
        self.point = entity.point
    }

    required init(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int ?? 0
        self.category = aDecoder.decodeObject(forKey: "category") as? String ?? ""
        self.box = aDecoder.decodeObject(forKey: "box") as? CGRect ?? .zero
        self.point = aDecoder.decodeObject(forKey: "point") as? CGPoint ?? .zero
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.category, forKey: "category")
        aCoder.encode(self.box, forKey: "box")
        aCoder.encode(self.point, forKey: "point")
    }

}
