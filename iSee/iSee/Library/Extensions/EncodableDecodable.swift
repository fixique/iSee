//
//  EncodableDecodable.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import Foundation

public extension Encodable {

    func toData(with encoder: JSONEncoder = JSONEncoder()) -> Data? {
        return try? encoder.encode(self)
    }

}

public extension Decodable {

    init(data: Data, decoder: JSONDecoder = JSONDecoder()) throws {
        self = try decoder.decode(Self.self, from: data)
    }

}
