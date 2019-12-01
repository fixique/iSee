//
//  MyFavoritesViewController.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class MyFavoritesViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var topContainerView: UIView!
    @IBOutlet private weak var screenTitle: UILabel!
    @IBOutlet private weak var grabberVIew: UIView!

    // MARK: - Properties

    var output: MyFavoritesViewOutput?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Private Properties

    private var adapter: CollectionAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - MyFavoritesViewInput

extension MyFavoritesViewController: MyFavoritesViewInput {

    func setupInitialState(with items: [ClotheItemEntity]) {
        configureCollectionTitle(with: "My favorites")
        configureAdapter(items: items)
    }

}

// MARK: - Configuration

private extension MyFavoritesViewController {

    func configureCollectionTitle(with title: String) {
        grabberVIew.backgroundColor = UIColor(red: 224.0 / 255.0, green: 224.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        grabberVIew.layer.cornerRadius = 2
        grabberVIew.layer.masksToBounds = true

        topContainerView.backgroundColor = UIColor.white.withAlphaComponent(0.95)

        screenTitle.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        screenTitle.text = title.lowercased().capitalizingFirstLetter()
    }

    func configureAdapter(items: [ClotheItemEntity]) {
        tableView.contentInset = UIEdgeInsets(top: 88.0, left: 0, bottom: 0, right: 0)
        adapter = CollectionAdapter(with: tableView)
        adapter?.configureCollection(with: items)
        adapter?.onItemSelect = { [weak self] item in
//            self?.output?.onItemSelect(item: item)
        }
        adapter?.onFavoritesSelect = { [weak self] item in
//            self?.output?.onFavoriteSelect(item: item)
        }
        tableView.dataSource = adapter
        tableView.delegate = adapter
        tableView.reloadData()
    }

}
