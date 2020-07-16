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
    let base = URL(string: "https://www.reddit.com")!
    
    func getPosts(forRequest request: RedditRequest, completion: @escaping (Result<[Post], Error>) -> Void) {
        
        let urlRequest = URLRequest(url: base.appendingPathComponent("r/\(request.terms)/\(request.filter.filter).json"))
        
        agent.getData(from: urlRequest, decoding: RedditData.self) { data, error in
            if let data = data {
                completion(.success(data.list.posts))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
    }
    
}
