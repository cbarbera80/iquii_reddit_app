//
//  RedditFilter.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

enum RedditFilter: CaseIterable {
    case none
    case hot
    case new
    case top
    
    var title: String {
        switch self {
        case .none:
            return "All"
        case .hot:
            return "Hot"
        case .new:
            return "New"
        case .top:
            return "Top"
        }
    }
    
    var filter: String? {
        switch self {
        case .none:
            return nil
        case .hot:
            return "/hot"
        case .new:
            return "/new"
        case .top:
            return "/top"
        }
    }
}
