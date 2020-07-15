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
    
    init(withWindow window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let listCoordinator = ListCoordinator(withWindow: window)
        listCoordinator.start()
        coordinators.append(listCoordinator)
    }
}
