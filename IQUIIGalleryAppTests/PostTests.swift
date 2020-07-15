//
//  PhotoTests.swift
//  IQUIIGalleryAppTests
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import XCTest
@testable import IQUIIGalleryApp

class PostTests: XCTestCase {
    
    func test_post() {
        // 1. given
        let sut = Post(thumbnailString: "http://www.google.it")
        
        // 2. when
        
        // 3. then
        XCTAssertNotNil(sut.thumbnail)
        assert(sut.thumbnail?.absoluteString == "http://www.google.it")
    }
}
