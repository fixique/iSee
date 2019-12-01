//
//  LoaderView.swift
//  iSee
//
//  Created by Vlad on 30.11.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

final class LoaderView: UIView {

    // MARK: - Private properties

    private var indicatorView: NVActivityIndicatorView?
    private let style: LoaderStyle

    // MARK: - Initialization

    init(style: LoaderStyle) {
        self.style = style
        super.init(frame: .zero)
        setupInitialState()
    }

    required init?(coder: NSCoder) {
        self.style = .white
        super.init(coder: coder)
        setupInitialState()
    }

}

// MARK: - Configuration

private extension LoaderView {

    func setupInitialState() {
        configureBackground()
        configureInicator()
    }

    func configureBackground() {
        backgroundColor = style.background
    }

    func configureInicator() {
        let indicatorView = NVActivityIndicatorView(frame: .zero, type: .ballPulse, color: style.dotsColor, padding: nil)
        addSubview(indicatorView)
        indicatorView.anchorSize(size: CGSize(width: 30, height: 30))
        indicatorView.anchorCenter(to: self, yOffset: -80)
        indicatorView.startAnimating()
        self.indicatorView = indicatorView
    }

}
