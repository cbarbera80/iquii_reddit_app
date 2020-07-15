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
    }
    
    func start() {
        let listCoordinator = ListCoordinator(withWindow: window, services: services)
        listCoordinator.start()
        coordinators.append(listCoordinator)
    }
}
