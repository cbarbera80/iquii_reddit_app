//
//  AppCoordinator.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let navigator = UINavigationController()
    var coordinators: [Coordinator] = []
    private let services: RedditServices
     
    init(withWindow window: UIWindow, services: RedditServices) {
        self.window = window
        self.services = services
        
        // Configure cache
        URLCache.shared.memoryCapacity = Constants.memoryCacheSize.mb
        URLCache.shared.diskCapacity = Constants.diskCacheSize.mb
    }
    
    func start() {
        let listCoordinator = PostsCoordinator(withWindow: window, services: services)
        listCoordinator.start()
        coordinators.append(listCoordinator)
    }
}
