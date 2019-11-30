//
//  PreviewImageView.swift
//  iSee
//
//  Created by Vlad on 30.11.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

final class PreviewImageView: UIView {

    // MARK: - Private Properties

    private let previewImageView = UIImageView(frame: .zero)

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setupInitialState()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitialState()
    }

    // MARK: - Internal Methods

    func setImage(_ image: UIImage?) {
        previewImageView.image = image
    }

}

// MARK: - Configuration

private extension PreviewImageView {

    func setupInitialState() {
        configureBackground()
        configureImageView()
    }

    func configureBackground() {
        layer.cornerRadius = 16.0
        layer.masksToBounds = true
        clipsToBounds = true
    }

    func configureImageView() {
        previewImageView.contentMode = .scaleAspectFill
        addSubview(previewImageView)
        previewImageView.fillSuperview()
    }

}
