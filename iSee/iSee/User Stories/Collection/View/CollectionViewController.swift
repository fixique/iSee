//
//  CollectionViewController.swift
//  iSee
//
//  Created by Vladislav Krupenko on 30/11/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class CollectionViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var topContainerView: UIView!
    @IBOutlet private weak var collectionTitle: UILabel!
    @IBOutlet private weak var grabberView: UIView!

    // MARK: - Properties

    var output: CollectionViewOutput?

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

// MARK: - CollectionViewInput

extension CollectionViewController: CollectionViewInput {

    func setupInitialState(collectionTitle: String) {
        configureCollectionTitle(with: collectionTitle)
        configureAdapter()
    }

}

// MARK: - Configuration

private extension CollectionViewController {

    func configureCollectionTitle(with title: String) {
        grabberView.backgroundColor = UIColor(red: 224.0 / 255.0, green: 224.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        grabberView.layer.cornerRadius = 2
        grabberView.layer.masksToBounds = true

        topContainerView.backgroundColor = UIColor.white.withAlphaComponent(0.6)

        collectionTitle.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        collectionTitle.text = title.lowercased().capitalizingFirstLetter()
    }

    func configureAdapter() {
        tableView.contentInset = UIEdgeInsets(top: 88.0, left: 0, bottom: 0, right: 0)
        adapter = CollectionAdapter(with: tableView)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        tableView.reloadData()
    }

}
