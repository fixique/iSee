//
//  LooksViewTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class LooksViewTests: XCTestCase {

    // MARK: - Properties

    private var view: LooksViewController?
    private var output: LooksViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = LooksViewController()
        output = LooksViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class LooksViewOutputMock: LooksViewOutput {
    }

}
