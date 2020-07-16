//
//  Photo.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

struct Post: Codable, Equatable {
    var thumbnailString: String
    
    var thumbnail: URL? {
        return URL(string: thumbnailString)
    }
    
    enum CodingKeys: String, CodingKey {
        case thumbnailString = "thumbnail"
    }
}
