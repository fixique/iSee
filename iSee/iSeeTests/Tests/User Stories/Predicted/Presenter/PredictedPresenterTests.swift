//
//  PredictedPresenterTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class PredictedPresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: PredictedPresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = PredictedPresenter()
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

    private final class MockRouter: PredictedRouterInput {
    }

    private final class MockViewController: PredictedViewInput {
    }

    private final class MockModuleOutput: PredictedModuleOutput {
    }

}
