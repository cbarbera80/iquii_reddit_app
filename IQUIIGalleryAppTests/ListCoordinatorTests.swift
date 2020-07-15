//
//  ListCoordinatorTests.swift
//  IQUIIGalleryAppTests
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import XCTest
@testable import IQUIIGalleryApp

class ListCoordinatorTests: XCTestCase {
    
    func testListCoordinator_onStart_shouldHaveRootController() {
        
        // 1. Given
        let sut = makeSut()
        
        // 2. When
        sut.start()
        
        // 3. Then
        assert(sut.window.rootViewController != nil)
    }
    
    func testListCoordinator_onStart_rootViewController_should_be_right() {
        
        // 1. Given
        let sut = makeSut()
        
        // 2. When
        sut.start()
        
        // 3. Then
        let root = sut.window.rootViewController
        assert(root is UINavigationController)
        assert((root as! UINavigationController).topViewController is ListViewController)
        
    }
    
    private func makeSut() -> ListCoordinator {
        let window = UIWindow()
        let listCoordinator = ListCoordinator(withWindow: window, services: MockRedditServices())
        return listCoordinator
    }
}
