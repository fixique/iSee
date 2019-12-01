//
//  MyWardrobeModuleConfiguratorTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class MyWardrobeModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: MyWardrobeViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load MyWardrobeViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = MyWardrobeModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "MyWardrobeViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MyWardrobePresenter, "output is not MyWardrobePresenter")

        guard let presenter: MyWardrobePresenter = viewController.output as? MyWardrobePresenter else {
            XCTFail("Cannot assign viewController.output as MyWardrobePresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in MyWardrobePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MyWardrobePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MyWardrobeRouter, "router is not MyWardrobeRouter")

        guard let router: MyWardrobeRouter = presenter.router as? MyWardrobeRouter else {
            XCTFail("Cannot assign presenter.router as MyWardrobeRouter")
            return
        }

        XCTAssertTrue(router.view is MyWardrobeViewController, "view in router is not MyWardrobeViewController")
    }

}
