//
//  BookmarksTableViewCell.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class BookmarksTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var post: Post? {
        didSet {
            postImageView.loadImage(from: post?.thumbnail)
            titleLabel.text = post?.title
            authorLabel.text = post?.author
            let points = "\(post?.score ?? 0)"
            pointsLabel.text =   "bookmarks.points.text".localized.replacingOccurrences(of: "%i", with: points)
        }
    }
}
