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

    // MARK: - Private Properties

    private let tableView: UITableView

    // MARK: - Initialization

    init(with tableView: UITableView) {
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = Constants.esitmatedHeight
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView = tableView
    }

}

// MARK: - UITableViewDataSource

extension CollectionAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionItemCell.nameOfClass) as? CollectionItemCell else {
            return UITableViewCell()
        }
        return cell
    }

}

// MARK: - UITableViewDelegate

extension CollectionAdapter: UITableViewDelegate {
}
