//
//  ListViewController.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Vars
    
    private let colors = [UIColor.red, UIColor.green, UIColor.black, UIColor.blue]
    var posts: [Post] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var layout: UICollectionViewLayout = {
        
        let fraction: CGFloat = 1 / 3
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    // MARK: - View controller
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = layout
        collectionView.register(ListCollectionViewCell.self)
    }
}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.post = posts[indexPath.item]
        return cell
    }
}
