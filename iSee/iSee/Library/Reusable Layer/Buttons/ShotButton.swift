//
//  ShotButton.swift
//  iSee
//
//  Created by Vlad on 30.11.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit
import SurfUtils

final class ShotButton: CommonButton {

    // MARK: - Properties

    private var roundView: UIView?
    private var roundViewHeightConstraint: NSLayoutConstraint?
    private var roundViewWidthCosntraint: NSLayoutConstraint?

    override func draw(_ rect: CGRect) {
        guard roundView == nil else {
            return
        }
        self.layer.cornerRadius = rect.height / 2
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialLight))
        blur.frame = self.bounds
        blur.isUserInteractionEnabled = false
        self.insertSubview(blur, at: 0)
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
        let roundView = UIView(frame: .zero)
        roundView.isUserInteractionEnabled = false
        roundView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        roundView.layer.cornerRadius = 40.0 / 2
        roundView.layer.masksToBounds = true
        self.roundView = roundView
        addSubview(roundView)
        roundView.translatesAutoresizingMaskIntoConstraints = false
        roundViewHeightConstraint = roundView.heightAnchor.constraint(equalToConstant: 40.0)
        roundViewWidthCosntraint = roundView.widthAnchor.constraint(equalToConstant: 40.0)
        roundView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        roundView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        roundViewWidthCosntraint?.isActive = true
        roundViewHeightConstraint?.isActive = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        roundViewWidthCosntraint?.constant = 32.0
        roundViewHeightConstraint?.constant = 32.0
        UIView.animate(withDuration: 0.1) {
            self.roundView?.layer.cornerRadius = 32.0 / 2
            self.layoutSubviews()
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        roundViewWidthCosntraint?.constant = 40.0
        roundViewHeightConstraint?.constant = 40.0
        UIView.animate(withDuration: 0.1) {
            self.roundView?.layer.cornerRadius = 40.0 / 2
            self.layoutSubviews()
        }
    }
}
