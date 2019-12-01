//
//  MyWardrobeViewController.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class MyWardrobeViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var screenTitle: UILabel!
    @IBOutlet private weak var topContainerView: UIView!
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: MyWardrobeViewOutput?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Private Properties

    private var adapter: WardrobeAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - MyWardrobeViewInput

extension MyWardrobeViewController: MyWardrobeViewInput {

    func setupInitialState() {
        configureCollectionTitle()
        configureAdapter()
    }

    func update(with items: [WardrobeEntity]) {
        adapter?.configure(with: items)
    }

}

// MARK: - Configuration

private extension MyWardrobeViewController {

    func configureCollectionTitle() {
        topContainerView.backgroundColor = UIColor.white.withAlphaComponent(0.95)

        screenTitle.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        screenTitle.text = "My wardrobe".lowercased().capitalizingFirstLetter()
    }

    func configureAdapter() {
        tableView.contentInset = UIEdgeInsets(top: 88.0, left: 0, bottom: 0, right: 0)
        adapter = WardrobeAdapter(with: tableView)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        tableView.reloadData()
    }

}

// MARK: - Actions

private extension MyWardrobeViewController {

    @IBAction func addToWardrobe(_ sender: Any) {
        output?.addToWardrob()
    }

}
