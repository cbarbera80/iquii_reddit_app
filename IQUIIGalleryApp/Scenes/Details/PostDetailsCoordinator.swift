//
//  PostDetailsCoordinator.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 17/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class PostDetailsCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    private let index: Int
    private let posts: [Post]
    private let viewController: PostDetailContainerViewController
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController, index: Int, posts: [Post], bookmarksManager: BookmarkManager) {
        self.presenter = presenter
        self.index = index
        self.posts = posts
        viewController = PostDetailContainerViewController(withIndex: index, posts: posts, bookmarksManager: bookmarksManager)
        
    }
    
    func start() {
        presenter.pushViewController(viewController, animated: true)
    }
}
