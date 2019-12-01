//
//  LooksCell.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

struct LooksCellModel {
    let itemImage: UIImage
    let profileImage: UIImage
    let name: String
    let profileUrl: String
    let likesCount: String
}

class LooksCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var profileLabel: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var likesCount: UILabel!
    @IBOutlet private weak var profileUrl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        itemImageView.layer.cornerRadius = 4.0
        itemImageView.layer.masksToBounds = true
        itemImageView.contentMode = .scaleAspectFill
        nameLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        profileUrl.textColor = UIColor(red: 130.0 / 255.0, green: 130.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
        profileUrl.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        favoriteButton.setImage(UIImage(asset: Asset.favoriteUnselected), for: .normal)
        favoriteButton.setImage(UIImage(asset: Asset.favoriteSelected), for: .selected)
        likesCount.textColor = UIColor(red: 130.0 / 255.0, green: 130.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
        likesCount.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        profileLabel.contentMode = .scaleAspectFill
        profileLabel.layer.cornerRadius = 32.0 / 2
        profileLabel.layer.masksToBounds = true
    }

    @IBAction func favoriteAction(_ sender: Any) {
        favoriteButton.isSelected.toggle()
    }

    func configure(with item: LooksCellModel) {
        itemImageView.image = item.itemImage
        profileLabel.image = item.profileImage
        nameLabel.text = item.name
        profileUrl.text = item.profileUrl
        likesCount.text = item.likesCount
    }
}
