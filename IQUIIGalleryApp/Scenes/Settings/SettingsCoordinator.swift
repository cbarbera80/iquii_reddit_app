//
//  SettingsCoordinator.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let viewController: SettingsViewController
    private let presenter: UIViewController
    
    init(presenter: UIViewController) {
        self.presenter = presenter
        viewController = SettingsViewController()
        navigation = UINavigationController(rootViewController: viewController)
    }
    
    func start() {
        presenter.present(navigation, animated: true, completion: nil)
    }
}
