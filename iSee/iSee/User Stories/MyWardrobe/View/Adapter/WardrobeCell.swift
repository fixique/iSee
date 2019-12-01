//
//  WardrobeCell.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class WardrobeCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var likeCount: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        itemImageView.layer.cornerRadius = 4.0
        itemImageView.layer.masksToBounds = true
        titleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        likeCount.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        likeCount.textColor = UIColor(red: 130.0 / 255.0, green: 130.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
    }

    // MARK: - Configure

    func configure(with item: WardrobeEntity) {
        titleLabel.text = item.name
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.image = item.image
        likeCount.text = String(Int.random(in: 1 ..< 5000))
    }

}
