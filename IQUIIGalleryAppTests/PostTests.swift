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
        let sut = Post(id: "1", title: "Fake post", author: "Claudio Barbera", urlString: "http://www.google.it")
        
        // 2. when
        
        // 3. then
        assert(sut.id == "1")
        assert(sut.title == "Fake post")
        assert(sut.author == "Claudio Barbera")
        XCTAssertNotNil(sut.url)
        assert(sut.url?.absoluteString == "http://www.google.it")
    }
}
