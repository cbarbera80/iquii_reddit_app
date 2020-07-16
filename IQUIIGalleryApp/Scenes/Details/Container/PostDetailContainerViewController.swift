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
    private let index: Int
    private let posts: [Post]
    
    // MARK: - UI
    lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        return pageViewController
    }()
    
    // MARK: - Init
    init(withIndex index: Int, posts: [Post]) {
        self.index = index
        self.posts = posts
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
        
        let first = PostDetailsViewController(withPost: posts[index])
        pageViewController.setViewControllers([first], direction: .forward, animated: false, completion: nil)
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
    
        pageViewController.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
}

extension PostDetailContainerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let details = viewController as? PostDetailsViewController, let postIndex = posts.firstIndex(of: details.post), postIndex > 0 else { return nil }
        
        return PostDetailsViewController(withPost: posts[postIndex - 1])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let details = viewController as? PostDetailsViewController, let postIndex = posts.firstIndex(of: details.post), postIndex < posts.count - 1 else { return nil }

        return PostDetailsViewController(withPost: posts[postIndex + 1])
    }
}

