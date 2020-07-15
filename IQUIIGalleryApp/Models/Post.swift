//
//  Photo.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

struct Post: Codable {
    var id: String
    var title: String
    var author: String
    var urlString: String
    
    var url: URL? {
        return URL(string: urlString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, author
        case urlString = "url"
    }
}
