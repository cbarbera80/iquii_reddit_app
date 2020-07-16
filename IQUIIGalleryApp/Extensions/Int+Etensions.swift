//
//  Int+Etensions.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

extension Int {
    var mb: Int {
        return kb * 1_024
    }
    
    var kb: Int {
        return self * 1024
    }
}
