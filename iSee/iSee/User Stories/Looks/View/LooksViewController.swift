//
//  LooksViewController.swift
//  iSee
//
//  Created by Vladislav Krupenko on 01/12/2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class LooksViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var topContainerView: UIView!
    @IBOutlet private weak var screenTitle: UILabel!
    @IBOutlet private weak var tableIView: UITableView!

    // MARK: - Properties

    var output: LooksViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - LooksViewInput

extension LooksViewController: LooksViewInput {

    func setupInitialState() {
        configureCollectionTitle()
        configureAdapter()
    }

}

// MARK: - Configuration

private extension LooksViewController {

    func configureCollectionTitle() {
        topContainerView.backgroundColor = UIColor.white.withAlphaComponent(0.95)

        screenTitle.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        screenTitle.text = "Looks".lowercased().capitalizingFirstLetter()
    }

    func configureAdapter() {

    }

}
