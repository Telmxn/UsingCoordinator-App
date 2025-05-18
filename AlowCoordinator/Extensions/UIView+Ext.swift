//
//  UIView+Ext.swift
//  AlowCoordinator
//
//  Created by Telman Yusifov on 18.05.25.
//

import UIKit
import SnapKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
}
