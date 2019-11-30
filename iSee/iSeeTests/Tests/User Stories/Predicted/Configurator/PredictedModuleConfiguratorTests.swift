//
//  PredictedModuleConfiguratorTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class PredictedModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: PredictedViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load PredictedViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = PredictedModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "PredictedViewController is nil after configuration")
        XCTAssertTrue(viewController.output is PredictedPresenter, "output is not PredictedPresenter")

        guard let presenter: PredictedPresenter = viewController.output as? PredictedPresenter else {
            XCTFail("Cannot assign viewController.output as PredictedPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in PredictedPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in PredictedPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is PredictedRouter, "router is not PredictedRouter")

        guard let router: PredictedRouter = presenter.router as? PredictedRouter else {
            XCTFail("Cannot assign presenter.router as PredictedRouter")
            return
        }

        XCTAssertTrue(router.view is PredictedViewController, "view in router is not PredictedViewController")
    }

}
