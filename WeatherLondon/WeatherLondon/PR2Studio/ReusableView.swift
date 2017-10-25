//
//  ReusableView.swift
//  trySwift
//
//  Created by Natasha Murashev on 9/20/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableView { }
