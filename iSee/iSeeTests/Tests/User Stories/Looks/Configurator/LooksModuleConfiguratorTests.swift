//
//  LooksModuleConfiguratorTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class LooksModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: LooksViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load LooksViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = LooksModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "LooksViewController is nil after configuration")
        XCTAssertTrue(viewController.output is LooksPresenter, "output is not LooksPresenter")

        guard let presenter: LooksPresenter = viewController.output as? LooksPresenter else {
            XCTFail("Cannot assign viewController.output as LooksPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in LooksPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in LooksPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is LooksRouter, "router is not LooksRouter")

        guard let router: LooksRouter = presenter.router as? LooksRouter else {
            XCTFail("Cannot assign presenter.router as LooksRouter")
            return
        }

        XCTAssertTrue(router.view is LooksViewController, "view in router is not LooksViewController")
    }

}
