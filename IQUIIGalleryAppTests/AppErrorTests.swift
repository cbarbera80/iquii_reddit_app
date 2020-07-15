//
//  AppErrorTests.swift
//  IQUIIGalleryAppTests
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import XCTest
@testable import IQUIIGalleryApp

class AppErrorTests: XCTestCase {

    func testAppError_should_notEmpty() {
        let sut = AppError.allCases
        assert(!sut.isEmpty)
    }
}
