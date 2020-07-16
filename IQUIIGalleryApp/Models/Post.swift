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
    let urlString: String?
    let title: String
    let author: String
    let score: Int
    let type: String?
    
    var thumbnail: URL? {
        return URL(string: thumbnailString)
    }
    
    var url: URL? {
        guard let urlString = urlString, type == "image" else { return thumbnail }
        return URL(string: urlString)
    }
    
    enum CodingKeys: String, CodingKey {
        case thumbnailString = "thumbnail"
        case title
        case author = "author_fullname"
        case score = "total_awards_received"
        case type = "post_hint"
        case urlString = "url_overridden_by_dest"
    }
}

enum PostType: String, Codable {
    case image
    case video = "hosted:video"
    
}

