//
//  PointView.swift
//  iSee
//
//  Created by Vlad on 30.11.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class PointView: UIButton {

    // MARK: - Private Properties

    private var insideCircle = UIView(frame: .zero)

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitialState()
    }


}

// MARK: - Configuration

private extension PointView {

    func setupInitialState() {
        configureBackground()
        configureRedCircle()
    }

    func configureBackground() {
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = self.frame.height / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2.0
        layer.masksToBounds = true
    }

    func configureRedCircle() {
        insideCircle.backgroundColor = UIColor(red: 255.0 / 255.0, green: 23.0 / 255.0, blue: 68.0 / 255.0, alpha: 0.8)
        insideCircle.layer.cornerRadius = 15.0 / 2
        insideCircle.layer.masksToBounds = true
        addSubview(insideCircle)
        insideCircle.anchorSize(size: CGSize(width: 15.0, height: 15.0))
        insideCircle.anchorCenter(to: self)
    }

}
