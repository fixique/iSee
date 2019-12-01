//
//  CollectionItemCell.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class CollectionItemCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var categoryType: UILabel!
    @IBOutlet private weak var itemName: UILabel!
    @IBOutlet private weak var itemPrice: UILabel!
    @IBOutlet private weak var itemShop: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension CollectionItemCell {

    func setupInitialState() {
        selectionStyle = .none
        configurePreviewImageView()
        configureLabels()
    }

    func configurePreviewImageView() {
        previewImageView.layer.cornerRadius = 4.0
        previewImageView.layer.masksToBounds = true
        previewImageView.contentMode = .scaleAspectFill
    }

    func configureLabels() {
        categoryType.textColor = UIColor(red: 130.0 / 255.0, green: 130.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
        categoryType.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)

        itemName.textColor = .black
        itemName.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)

        itemPrice.textColor = .black
        itemPrice.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)

        itemShop.textColor = UIColor(red: 0.0, green: 27.0 / 255.0, blue: 194.0 / 255.0, alpha: 1.0)
        itemShop.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }

}
