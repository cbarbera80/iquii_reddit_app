//
//  ListCollectionViewCell.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var post: Post? {
        didSet {
            imageView.loadImage(from: post?.thumbnail)
        }
    }
}
