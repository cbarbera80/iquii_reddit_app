//
//  ListCoordinator.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class ListCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let window: UIWindow
    let navigation: UINavigationController
    let listViewController: ListViewController
    let services: RedditServices
    
    init(withWindow window: UIWindow, services: RedditServices) {
        listViewController = ListViewController()
        self.services = services
        navigation = UINavigationController(rootViewController: listViewController)
        self.window = window
    }
    
    func start() {
        window.rootViewController = navigation
    }
    
}
