//
//  CollectionItemCell.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit
import AlamofireImage

final class CollectionItemCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var itemName: UILabel!
    @IBOutlet private weak var itemPrice: UILabel!
    @IBOutlet private weak var itemShop: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!

    // MARK: - Properties

    var onFavoriteSelect: EmptyClosure?
    var onFavoriteUnselect: EmptyClosure?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

    // MARK: - Internal Methods

    func configure(with item: ClotheItemEntity) {
        itemName.text = item.name
        itemPrice.text = String(format: "%.2f", item.price) + " ₽"
        itemShop.text = item.source
        previewImageView.image = nil
        loadImage(with: item.imageUrl)
        favoriteButton.isSelected = DataStorage.shared.isFavorite(item)
    }

}

// MARK: - Configuration

private extension CollectionItemCell {

    func setupInitialState() {
        selectionStyle = .none
        configurePreviewImageView()
        configureLabels()
        configureFavoriteButton()
    }

    func configurePreviewImageView() {
        previewImageView.layer.cornerRadius = 4.0
        previewImageView.layer.masksToBounds = true
        previewImageView.contentMode = .scaleAspectFill
        previewImageView.backgroundColor = .lightGray
    }

    func configureLabels() {
        itemName.textColor = .black
        itemName.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)

        itemPrice.textColor = .black
        itemPrice.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)

        itemShop.textColor = UIColor(red: 0.0, green: 27.0 / 255.0, blue: 194.0 / 255.0, alpha: 1.0)
        itemShop.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }

    func configureFavoriteButton() {
        favoriteButton.setImage(UIImage(asset: Asset.favoriteUnselected), for: .normal)
        favoriteButton.setImage(UIImage(asset: Asset.favoriteSelected), for: .selected)
    }

}

// MARK: - Actions

private extension CollectionItemCell {

    @IBAction func favoriteAction(_ sender: Any) {
        if favoriteButton.isSelected {
            onFavoriteUnselect?()
        } else {
            onFavoriteSelect?()
        }
        favoriteButton.isSelected.toggle()
    }

}

// MARK: - Help Methods

private extension CollectionItemCell {

    func loadImage(with url: String) {
        guard let url = URL(string: url) else {
            return
        }
        previewImageView.af_setImage(withURL: url,
                                     placeholderImage: nil,
                                     imageTransition: UIImageView.ImageTransition.crossDissolve(0.2),
                                     runImageTransitionIfCached: false,
                                     completion: nil)
    }

}
