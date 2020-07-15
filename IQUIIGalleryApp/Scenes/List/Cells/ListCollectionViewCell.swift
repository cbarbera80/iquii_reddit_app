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
            loadImage(from: post?.thumbnail, placeholder: UIImage(named: "placeholder"))
        }
    }
    
    private func loadImage(from url: URL?, placeholder: UIImage?) {
        guard let url = url else { return }
        
        let request = URLRequest(url: url)
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = URLCache.shared.cachedResponse(for: request)?.data , let image = UIImage(data: data) {
                
                DispatchQueue.main.async { [weak self] in
                    self?.imageView.transition(to: image)
                }
            } else {
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data, let response = response, let image = UIImage(data: data) {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        URLCache.shared.storeCachedResponse(cachedData, for: request)
                        
                        DispatchQueue.main.async { [weak self] in
                            self?.imageView.transition(to: image)
                        }
                    } else if let placeholder = placeholder {
                        DispatchQueue.main.async { [weak self] in
                            self?.imageView.transition(to: placeholder)
                        }
                    }
                }.resume()
            }
        }
    }
}
