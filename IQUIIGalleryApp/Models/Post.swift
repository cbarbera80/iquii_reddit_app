//
//  Photo.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

struct Post: Codable, Hashable {
    let thumbnailString: String
    let title: String
    let author: String
    let score: Int
    
    var thumbnail: URL? {
        return URL(string: thumbnailString)
    }
    
    enum CodingKeys: String, CodingKey {
        case thumbnailString = "thumbnail"
        case title
        case author = "author_fullname"
        case score = "total_awards_received"
    }
}
