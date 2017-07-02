//
//  Extensions.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

extension CGFloat {
    static var fibConstant: CGFloat = 0.61818
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: self.maxX/2, y: self.maxY/2)
    }
}

extension UIColor {
    static var randomColor: UIColor {
        return UIColor(red:CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
}

extension NSObject {
    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

