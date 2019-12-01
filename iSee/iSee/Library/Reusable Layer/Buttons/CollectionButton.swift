//
//  CollectionButton.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit
import SurfUtils

final class CollectionButton: CommonButton {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = rect.height / 2
        self.layer.cornerRadius = rect.height / 2
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialLight))
        blur.contentView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        blur.frame = self.bounds
        blur.isUserInteractionEnabled = false
        self.insertSubview(blur, at: 0)
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
    }

}
