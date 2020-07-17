//
//  BookmarksViewController.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

protocol BookmarksViewControllerDelegate: class {
    func removeBookmark(_ bookmark: Post)
    func openDetails(index: Int, posts: [Post])
}

class BookmarksViewController: UIViewController {

    weak var delegate: BookmarksViewControllerDelegate?
    var items: [Post] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - UI
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(BookmarksTableViewCell.self)
        return table
    }()
    
    // MARK: - Init
    init(withItems items: [Post]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "bookmarks.page.title".localized
        view.backgroundColor = .white
        tableView.pin(to: view)
    }
}

extension BookmarksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BookmarksTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.post = items[indexPath.row]
        return cell
    }
}

extension BookmarksViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        
        tableView.beginUpdates()
        
        let post = items[indexPath.row]
        items.remove(at: indexPath.row)
        delegate?.removeBookmark(post)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.openDetails(index: indexPath.row, posts: items)
    }
}
