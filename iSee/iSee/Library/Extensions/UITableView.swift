//
//  UITableView.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

extension NSObject {

    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }

}

extension UITableView {

    func registerCell(_ cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.nameOfClass)
    }

}
