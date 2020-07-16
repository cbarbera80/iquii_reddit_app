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
        navigation.navigationBar.prefersLargeTitles = true
        self.window = window
    }
    
    func start() {
        listViewController.delegate = self
        window.rootViewController = navigation
        search(withKeyword: "All", andFilter: .top)
    }
}

extension ListCoordinator: ListViewControllerDelegate {
    func search(withKeyword keyword: String?, andFilter filter: RedditFilter) {
        
        guard let keyword = keyword else { return }
        
        listViewController.status = .loading
        
        services.getPosts(forKeyword: keyword, andFilter: filter) { [weak self] result in
            switch result {
            case .success(let posts):
                self?.listViewController.status = posts.isEmpty ? .noData : .completed(posts: posts)
            case .failure(let error):
                self?.listViewController.status = .error(error: error)
            }
        }
    }
}
