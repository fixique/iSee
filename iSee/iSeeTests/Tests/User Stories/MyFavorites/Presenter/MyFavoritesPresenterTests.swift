//
//  MyFavoritesPresenterTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class MyFavoritesPresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: MyFavoritesPresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = MyFavoritesPresenter()
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

    private final class MockRouter: MyFavoritesRouterInput {
    }

    private final class MockViewController: MyFavoritesViewInput {
    }

    private final class MockModuleOutput: MyFavoritesModuleOutput {
    }

}
