//
//  RealRedditServices.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation
import Combine

class RealRedditServices: RedditServices {
    
    let agent = Agent()
    
    func getPosts(forRequest request: PostsRequest, completion: @escaping (Result<[Post], Error>) -> Void) {
        
        var urlRequest = URLRequest(url: request.url)
        
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        
        agent.getData(from: urlRequest, decoding: RedditData.self) { data, error in
            if let data = data {
                completion(.success(data.list.posts))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
