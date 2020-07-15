//
//  MockRedditServices.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

class MockRedditServices: RedditServices {
    
    func getPosts(forKeyword keyword: String, completion: (Result<[Post], AppError>) -> Void) {
        let mock = MockMapOperation<RedditData>()
        
        guard let data = mock.decode(from: "posts") else {
            completion(.failure(.invalid))
            return
        }
        
        completion(.success(data.list.posts))
    }
}
