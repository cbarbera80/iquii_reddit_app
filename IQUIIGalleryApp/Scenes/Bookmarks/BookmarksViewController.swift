//
//  BookmarksViewController.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

class BookmarksViewController: UIViewController {

    private let items: [Post]
    
    // MARK: - UI
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
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
        title = "Bookmarks"
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
