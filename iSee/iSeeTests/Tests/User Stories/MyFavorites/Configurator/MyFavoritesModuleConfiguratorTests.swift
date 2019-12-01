//
//  MyFavoritesModuleConfiguratorTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class MyFavoritesModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: MyFavoritesViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load MyFavoritesViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = MyFavoritesModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "MyFavoritesViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MyFavoritesPresenter, "output is not MyFavoritesPresenter")

        guard let presenter: MyFavoritesPresenter = viewController.output as? MyFavoritesPresenter else {
            XCTFail("Cannot assign viewController.output as MyFavoritesPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in MyFavoritesPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MyFavoritesPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MyFavoritesRouter, "router is not MyFavoritesRouter")

        guard let router: MyFavoritesRouter = presenter.router as? MyFavoritesRouter else {
            XCTFail("Cannot assign presenter.router as MyFavoritesRouter")
            return
        }

        XCTAssertTrue(router.view is MyFavoritesViewController, "view in router is not MyFavoritesViewController")
    }

}
