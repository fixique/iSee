//
//  StatePresentable.swift
//  iSee
//
//  Created by Vlad on 30.11.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

enum LoaderStyle {
    case white
    case black

    var dotsColor: UIColor {
        switch self {
        case .white:
            return UIColor.white
        case .black:
            return UIColor.black
        }
    }

    var background: UIColor {
        switch self {
        case .white:
            return .clear
        case .black:
            return .white
        }
    }

}

protocol StatePresentable: class {
    /// Method will show loader with specified present parameter
    func showLoader(style: LoaderStyle)
    /// Method will hide loader if it exist
    func hideLoader()
}

extension StatePresentable where Self: UIViewController {

    // MARK: - Private Properties

    private var loaderView: LoaderView? {
        if let loader = view.subviews.findMoreLoader() {
            return loader
        }
        return UIApplication.shared.windows.first?.subviews.findMoreLoader()
    }

    // MARK: - Public Methods

    func showLoader(style: LoaderStyle) {
        guard loaderView == nil else {
            return
        }
        let loader = LoaderView(style: style)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.alpha = 0.0
        view.addSubview(loader)
        loader.fillSuperview()
        view.bringSubviewToFront(loader)

        UIView.animate(withDuration: 0.3) {
            loader.alpha = 1.0
        }
    }

    func hideLoader() {
        guard let loaderView = loaderView else {
            return
        }
        UIView.animate(withDuration: 0.3,
                       animations: {
            loaderView.alpha = 0.0
        }) { (_) in
            loaderView.removeFromSuperview()
        }
    }

}

fileprivate extension Array where Element == UIView {

    func findMoreLoader() -> LoaderView? {
        return first(where: { $0 is LoaderView }) as?  LoaderView
    }

}
