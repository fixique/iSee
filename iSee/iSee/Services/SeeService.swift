//
//  SeeService.swift
//  iSee
//
//  Created by Vlad on 30.11.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import NodeKit

final class SeeService {

    // MARK: - Keys

    private enum Keys {
        static let image = "image"
    }

    // MARK: - Methods

    func predict(image64: String) -> Observer<[PredictedBoxEntity]> {
        return UrlChainsBuilder()
            .default(with: UrlChainConfigModel(method: .post, route: MainRoute.predict, metadata: ["Content-Type": "application/json"], encoding: .json))
            .process([Keys.image: image64])
    }

}
