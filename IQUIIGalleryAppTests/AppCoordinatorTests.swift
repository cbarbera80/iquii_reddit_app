//
//  AppCoordinatorTests.swift
//  IQUIIGalleryAppTests
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import XCTest
@testable import IQUIIGalleryApp

class AppCoordinatorTests: XCTestCase {
    
    func testAppCoordinator_onStart_shouldHaveChildCoordinator() {
        
        // 1. Given
        let sut = makeSut()
        
        // 2. When
        sut.start()
        
        // 3. Then
        assert(!sut.coordinators.isEmpty)
    }
    
    func makeSut() -> AppCoordinator {
        let window = UIWindow()
        let services = MockRedditServices()
        let coordinator = AppCoordinator(withWindow: window, services: services)
        return coordinator
    }
}
