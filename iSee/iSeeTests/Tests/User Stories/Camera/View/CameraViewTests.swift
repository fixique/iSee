//
//  CameraViewTests.swift
//  iSee
//
//  Created by Vladislav Krupenko on 29/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import XCTest
@testable import iSee

final class CameraViewTests: XCTestCase {

    // MARK: - Properties

    private var view: CameraViewController?
    private var output: CameraViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = CameraViewController()
        output = CameraViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class CameraViewOutputMock: CameraViewOutput {
    }

}
