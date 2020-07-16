//
//  UISearcBarTextField.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

extension UISearchTextField {
    var searchBar: UISearchBar? {
        return self.superview?.superview?.superview as? UISearchBar
    }
}
