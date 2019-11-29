//
//  CameraPresenterTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class CameraPresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: CameraPresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = CameraPresenter()
        presenter?.router = MockRouter()
        view = MockViewController()
        presenter?.view = view
        output = MockModuleOutput()
        presenter?.output = output
    }

    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class MockRouter: CameraRouterInput {
    }

    private final class MockViewController: CameraViewInput {
    }

    private final class MockModuleOutput: CameraModuleOutput {
    }

}
