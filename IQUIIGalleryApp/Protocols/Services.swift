//
//  Services.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

protocol RedditServices {
    func getPosts(forKeyword keyword: String, completion: Result<[Post], AppError>)
}
