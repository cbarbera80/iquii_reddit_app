//
//  MockMapOperationTests.swift
//  IQUIIGalleryAppTests
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import XCTest
@testable import IQUIIGalleryApp

class MockMapOperationTests: XCTestCase {

    func mockMapOperation_onDecode_shouldDecode() {
        
        // 1. Given
        let sut = MockMapOperation<[Post]>()
            
        // 2. When
        let posts = sut.decode(from: "posts")
        
        // 3. Then
        XCTAssertNotNil(posts)
        XCTAssertFalse(posts!.isEmpty)
        XCTAssert(posts!.count == 25)
    }
}
