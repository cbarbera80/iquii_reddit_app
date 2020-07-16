//
//  BookmarksManager.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

class BookmarkManager {
    
    private var data: Set<Post>

    init() {
        self.data = Set(UserDefaultsConfig.bookmarks ?? [])
    }

    func contains(_ object: Post) -> Bool {
        data.contains(object)
    }
    
    func add(_ object: Post) {
        data.insert(object)
        save()
    }

    func remove(_ object: Post) {
        data.remove(object)
        save()
    }

    func save() {
        UserDefaultsConfig.bookmarks = Array(data)
    }
}
