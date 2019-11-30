//
//  CollectionPresenterTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class CollectionPresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: CollectionPresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = CollectionPresenter()
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

    private final class MockRouter: CollectionRouterInput {
    }

    private final class MockViewController: CollectionViewInput {
    }

    private final class MockModuleOutput: CollectionModuleOutput {
    }

}
