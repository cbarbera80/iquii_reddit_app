//
//  ListCoordinator.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class PostsCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let listViewController: ListViewController
    let services: RedditServices
    let bookmarksManager: BookmarkManager
    
    init(services: RedditServices, bookmarksManager: BookmarkManager = BookmarkManager()) {
        listViewController = ListViewController()
        self.services = services
        self.bookmarksManager = bookmarksManager
        navigation = UINavigationController(rootViewController: listViewController)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.bullet"), selectedImage: UIImage(systemName: "list.bullet"))
        
    }
    
    func start() {
        listViewController.delegate = self
        search(withRequest: .init(terms: "All", filter: .top))
    }
}

extension PostsCoordinator: ListViewControllerDelegate {
    
    func search(withRequest request: PostsRequest) {
        
        guard request.isValid else { return }
        
        listViewController.status = .loading
        
        services.getPosts(forRequest: request) { [weak self] result in
            switch result {
            case .success(let posts):
                self?.listViewController.status = posts.isEmpty ? .noData : .completed(posts: posts)
            case .failure(let error):
                self?.listViewController.status = .error(error: error)
            }
        }
    }
    
    func didSelectPost(atIndex index: Int, posts: [Post]) {
        let detailsContainer = PostDetailContainerViewController(withIndex: index, posts: posts, bookmarksManager: bookmarksManager)
        navigation.pushViewController(detailsContainer, animated: true)
    }
}
