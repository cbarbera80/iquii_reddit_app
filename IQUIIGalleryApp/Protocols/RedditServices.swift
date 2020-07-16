//
//  Services.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation
import Combine

protocol RedditServices {
    func getPosts(forRequest request: PostsRequest, completion: @escaping (Result<[Post], Error>) -> Void)
}
