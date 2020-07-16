//
//  PostDetailContainerViewController.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class PostDetailContainerViewController: UIViewController {
    
    // MARK: - Vars
    private var index: Int
    private let posts: [Post]
    private let bookmarksManager: BookmarkManager
    
    // MARK: - UI
    lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        return pageViewController
    }()
    
    // MARK: - Init
    init(withIndex index: Int, posts: [Post], bookmarksManager: BookmarkManager) {
        self.index = index
        self.posts = posts
        self.bookmarksManager = bookmarksManager
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pageViewController.view.pin(to: view)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(toggleBookmark))
        
        let first = getDetailsViewController(atIndex: index)
        pageViewController.setViewControllers([first], direction: .forward, animated: false, completion: nil)
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
    }
    
    @objc
    func toggleBookmark() {
        guard let current = pageViewController.viewControllers?.last as? PostDetailsViewController else { return }
        
        bookmarksManager.contains(current.post) ? bookmarksManager.remove(current.post) : bookmarksManager.add(current.post)
    }
}

extension PostDetailContainerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let details = viewController as? PostDetailsViewController, let postIndex = posts.firstIndex(of: details.post), postIndex > 0 else { return nil }
    
        return getDetailsViewController(atIndex: postIndex - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let details = viewController as? PostDetailsViewController, let postIndex = posts.firstIndex(of: details.post), postIndex < posts.count - 1 else { return nil }
      
        return getDetailsViewController(atIndex: postIndex + 1)
    }
    
    private func getDetailsViewController(atIndex index: Int) -> PostDetailsViewController {
        let post = posts[index]
        let isBookmarked = bookmarksManager.contains(post)
        return PostDetailsViewController(withPost: post, isBookmarked: isBookmarked)
    }
}

