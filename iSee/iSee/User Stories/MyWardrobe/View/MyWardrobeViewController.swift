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
    }

    func update(with items: [WardrobeEntity]) {

    }

}

// MARK: - Configuration

private extension MyWardrobeViewController {

    func configureCollectionTitle() {
        topContainerView.backgroundColor = UIColor.white.withAlphaComponent(0.95)

        screenTitle.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        screenTitle.text = "My wardrobe".lowercased().capitalizingFirstLetter()
    }

}

// MARK: - Actions

private extension MyWardrobeViewController {

    @IBAction func addToWardrobe(_ sender: Any) {

    }

}
