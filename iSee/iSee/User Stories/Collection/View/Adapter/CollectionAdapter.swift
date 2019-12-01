//
//  CollectionAdapter.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class CollectionAdapter: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let esitmatedHeight: CGFloat = 164.0
    }

    // MARK: - Properties

    var onItemSelect: ((ClotheItemEntity) -> Void)?
    var onFavoritesSelect: ((ClotheItemEntity) -> Void)?

    // MARK: - Private Properties

    private let tableView: UITableView
    private var items: [ClotheItemEntity] = []

    // MARK: - Initialization

    init(with tableView: UITableView) {
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = Constants.esitmatedHeight
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView = tableView
    }

    // MARK: - Internal Methods

    func configureCollection(with items: [ClotheItemEntity]) {
        self.items = items
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension CollectionAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionItemCell.nameOfClass) as? CollectionItemCell else {
            return UITableViewCell()
        }
        cell.configure(with: items[indexPath.row])
        cell.onFavoriteSelect = { [weak self] in
            guard let item = self?.items[indexPath.row] else {
                return
            }
            self?.onFavoritesSelect?(item)
        }
        return cell
    }

}

// MARK: - UITableViewDelegate

extension CollectionAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onItemSelect?(items[indexPath.row])
    }

}
