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
    private let redditFilters = RedditFilter.allCases
    
    var posts: [Post] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    lazy var layout: UICollectionViewLayout = {
        
        let fraction: CGFloat = 1 / 3
        let inset: CGFloat = 2.5
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
      
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here..."
        search.searchBar.scopeButtonTitles = redditFilters.map { $0.title }
        return search
    }()
    
    
    
    // MARK: - View controller
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = layout
        title = "IQUII Gallery"
        collectionView.register(ListCollectionViewCell.self)
        navigationItem.searchController = searchController
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
