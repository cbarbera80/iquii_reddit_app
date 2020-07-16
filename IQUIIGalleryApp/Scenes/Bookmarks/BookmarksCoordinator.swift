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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    init(bookmarkManager: BookmarkManager) {
        viewController = BookmarksViewController(withItems: bookmarkManager.bookmarks)
        self.bookmarkManager = bookmarkManager
        
        navigation = UINavigationController(rootViewController: viewController)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.tabBarItem = UITabBarItem(title: "Bookmarks", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadBookmarks), name: Notifications.bookmarksUpdated, object: nil)
        

    }
    
    func start() {
        viewController.delegate = self
    }
    
    @objc
    private func reloadBookmarks() {
        viewController.items = bookmarkManager.bookmarks
    }
}

extension BookmarksCoordinator: BookmarksViewControllerDelegate {
    func removeBookmark(_ bookmark: Post) {
        bookmarkManager.remove(bookmark)
    }
}
