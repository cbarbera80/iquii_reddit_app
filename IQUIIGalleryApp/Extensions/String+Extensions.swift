//
//  String+Extensions.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 17/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
