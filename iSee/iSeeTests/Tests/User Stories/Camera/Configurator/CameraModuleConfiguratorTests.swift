//
//  CameraModuleConfiguratorTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class CameraModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: CameraViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load CameraViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = CameraModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "CameraViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CameraPresenter, "output is not CameraPresenter")

        guard let presenter: CameraPresenter = viewController.output as? CameraPresenter else {
            XCTFail("Cannot assign viewController.output as CameraPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in CameraPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CameraPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CameraRouter, "router is not CameraRouter")

        guard let router: CameraRouter = presenter.router as? CameraRouter else {
            XCTFail("Cannot assign presenter.router as CameraRouter")
            return
        }

        XCTAssertTrue(router.view is CameraViewController, "view in router is not CameraViewController")
    }

}
