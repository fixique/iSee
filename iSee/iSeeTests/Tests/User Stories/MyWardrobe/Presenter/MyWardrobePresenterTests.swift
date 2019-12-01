//
//  MyWardrobePresenterTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class MyWardrobePresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: MyWardrobePresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = MyWardrobePresenter()
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

    private final class MockRouter: MyWardrobeRouterInput {
    }

    private final class MockViewController: MyWardrobeViewInput {
    }

    private final class MockModuleOutput: MyWardrobeModuleOutput {
    }

}
