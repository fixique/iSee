//
//  LooksAdapter.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class LooksAdapter: NSObject {

    // MARK: – Constants

    private enum Constants {
        static let estimatedHeight: CGFloat = 400
    }

    // MARK: - Private Properties

    private let tableView: UITableView
    private var items: [LooksCellModel] = []

    // MARK: - Initialization

    init(with tableView: UITableView) {
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = Constants.estimatedHeight
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView = tableView
    }

    // MARK: - Internal Methods

    func configure(with items: [LooksCellModel]) {
        self.items = items
        self.tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension LooksAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LooksCell.nameOfClass) as? LooksCell else {
            return UITableViewCell()
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }

}

// MARK: - UITableViewDelegate

extension LooksAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
