//
//  MainRoute.swift
//  iSee
//
//  Created by Vlad on 30.11.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import NodeKit

enum MainRoute {
    case predict
    case findSimilar
}

// MARK: - UrlRouteProvider

extension MainRoute: UrlRouteProvider {

    func url() throws -> URL {
        let base = URL(string: "https://ml.surfstudio.ru:8010/")
        switch self {
        case .predict:
            return try base + "predict"
        case .findSimilar:
            return try base + "findsimilar"
        }
    }

}
