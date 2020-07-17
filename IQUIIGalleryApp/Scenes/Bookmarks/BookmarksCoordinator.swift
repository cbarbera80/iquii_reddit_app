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
        
        navigation = WhiteNavigationController(rootViewController: viewController)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.tabBarItem = UITabBarItem(title: "tab_bar.bookmarks".localized, image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        
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
    
    func openDetails(index: Int, posts: [Post]) {
        removeCoordinator(PostDetailsCoordinator.self)
        let detailsCoordinator = PostDetailsCoordinator(presenter: navigation, index: index, posts: posts, bookmarksManager: bookmarkManager)
        detailsCoordinator.start()
        coordinators.append(detailsCoordinator)
    }
    
    func removeBookmark(_ bookmark: Post) {
        bookmarkManager.remove(bookmark)
    }
}
