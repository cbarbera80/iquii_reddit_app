//
//  RedditRequest.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

protocol RedditRequest {
    var url: URL { get }
}

struct PostsRequest: RedditRequest {
    let terms: String
    let filter: RedditFilter
    
    var url: URL {
        return Constants.baseURL.appendingPathComponent("r/\(terms)/\(filter.filter).json")
    }
}
