//
//  RedditServicesTests.swift
//  IQUIIGalleryAppTests
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import XCTest
@testable import IQUIIGalleryApp

class RedditServicesTests: XCTestCase {

    func test_redditServices_shouldReturnPosts() {
        // 1. Given
        let sut = MockRedditServices()
        
        // 2. When
        sut.getPosts(forKeyword: "all") { result in
            if case .success(let data) = result {
                
                // 3. Then
                assert(data.count == 25)
            } else {
                assertionFailure()
            }
        }
    }
}
