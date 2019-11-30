//
//  PredictedViewTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class PredictedViewTests: XCTestCase {

    // MARK: - Properties

    private var view: PredictedViewController?
    private var output: PredictedViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = PredictedViewController()
        output = PredictedViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class PredictedViewOutputMock: PredictedViewOutput {
    }

}
