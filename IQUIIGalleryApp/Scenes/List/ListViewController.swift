//
//  ListViewController.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit
import Combine

protocol ListViewControllerDelegate: class {
    func search(withRequest request: PostsRequest)
}

class ListViewController: UIViewController {

    // MARK: - Enums
    enum ListViewControllerStatus {
        case idle
        case loading
        case completed(posts: [Post])
        case noData
        case error(error: Error)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - Vars
    private var searchTermSubject = PassthroughSubject<String, Never>()
    private var filterSubject = PassthroughSubject<RedditFilter, Never>()
    
    weak var delegate: ListViewControllerDelegate?
    var status: ListViewControllerStatus = .idle {
        didSet {
            switch status {
            case .idle:
                break
            case .loading:
                collectionView?.isHidden = true
                statusLabel?.isHidden = false
                statusLabel?.text = "Loading data..."
            case .completed(let posts):
                collectionView?.isHidden = false
                statusLabel?.isHidden = true
                self.posts = posts
                self.collectionView?.reloadData()
            case .noData:
                collectionView?.isHidden = true
                statusLabel?.isHidden = false
                statusLabel?.text = "No data found"
            case .error(let error):
                collectionView?.isHidden = true
                statusLabel?.isHidden = false
                statusLabel?.text = error.localizedDescription
            }
        }
    }
    
    private let redditFilters = RedditFilter.allCases
    private var store: [AnyCancellable] = []
    private var posts: [Post] = []
    
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
        search.searchResultsUpdater = self
        return search
    }()
    
    // MARK: - View controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "IQUII Gallery"
        
        // Collection view setup
        collectionView.collectionViewLayout = layout
        collectionView.register(ListCollectionViewCell.self)
        
        // Search setup
        navigationItem.searchController = searchController
         
        // Events listener setup
        let subscription = Publishers
            .CombineLatest(searchTermSubject, filterSubject)
            .map { PostsRequest(terms: $0.0, filter: $0.1) }
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
            .sink { request in self.delegate?.search(withRequest: request) }
        
        subscription.store(in: &store)
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

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        let scope = searchController.searchBar.selectedScopeButtonIndex
        
        searchTermSubject.send(searchText)
        filterSubject.send(redditFilters[scope])
    }
}
