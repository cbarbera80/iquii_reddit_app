//
//  BookmarksCoordinator.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class BookmarksCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let viewController: BookmarksViewController
    let bookmarkManager: BookmarkManager
    
    init(bookmarkManager: BookmarkManager) {
        viewController = BookmarksViewController(withItems: bookmarkManager.bookmarks)
        self.bookmarkManager = bookmarkManager
        
        navigation = UINavigationController(rootViewController: viewController)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.tabBarItem = UITabBarItem(title: "Bookmarks", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))

    }
    
    func start() { }
}
