//
//  SceneDelegate.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let scene = (scene as? UIWindowScene) else { return }
       
        let window = UIWindow(windowScene: scene)
        let services = MockRedditServices()
        let appCoordinator = AppCoordinator(withWindow: window, services: services)
        appCoordinator.start()
        self.coordinator = appCoordinator
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

