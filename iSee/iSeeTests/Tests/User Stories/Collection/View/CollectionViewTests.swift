//
//  CollectionViewTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class CollectionViewTests: XCTestCase {

    // MARK: - Properties

    private var view: CollectionViewController?
    private var output: CollectionViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = CollectionViewController()
        output = CollectionViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class CollectionViewOutputMock: CollectionViewOutput {
    }

}
