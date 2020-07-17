//
//  PostList.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

struct RedditData: Decodable {
    let list: Listing
    
    enum CodingKeys: String, CodingKey {
        case list = "data"
    }
}

struct Listing: Decodable {
    private let children: [ListPost]
    
    var posts: [Post] {
        return children.compactMap { $0.data }
    }
}

struct ListPost: Decodable {
    let kind: String
    let data: Post?
}
