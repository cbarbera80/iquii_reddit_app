//
//  PostDetailsViewController.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {
 
    // MARK: - Vars
    private let post: Post
    
    // MARK: - Init
    init(withPost post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View controller
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
