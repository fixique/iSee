//
//  CollectionModuleConfiguratorTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class CollectionModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: CollectionViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load CollectionViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = CollectionModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "CollectionViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CollectionPresenter, "output is not CollectionPresenter")

        guard let presenter: CollectionPresenter = viewController.output as? CollectionPresenter else {
            XCTFail("Cannot assign viewController.output as CollectionPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in CollectionPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CollectionPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CollectionRouter, "router is not CollectionRouter")

        guard let router: CollectionRouter = presenter.router as? CollectionRouter else {
            XCTFail("Cannot assign presenter.router as CollectionRouter")
            return
        }

        XCTAssertTrue(router.view is CollectionViewController, "view in router is not CollectionViewController")
    }

}
