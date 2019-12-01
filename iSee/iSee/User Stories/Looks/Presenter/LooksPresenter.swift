//
//  LooksPresenter.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

final class LooksPresenter {

    // MARK: - Properties

    weak var view: LooksViewInput?
    var router: LooksRouterInput?
    var output: LooksModuleOutput?
}

// MARK: - LooksViewOutput

extension LooksPresenter: LooksViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}

// MARK: - LooksModuleInput

extension LooksPresenter: LooksModuleInput {
}
