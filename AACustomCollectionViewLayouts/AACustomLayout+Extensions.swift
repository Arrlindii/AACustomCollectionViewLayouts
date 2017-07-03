//
//  Extensions.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

public extension CGFloat {
    static var aaFibConstant: CGFloat = 0.61818
}

public extension CGRect {
    var aaRectCenter: CGPoint {
        return CGPoint(x: self.maxX/2, y: self.maxY/2)
    }
}

public extension UIColor {
    static var aaRandomColor: UIColor {
        return UIColor(red:CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
}

public extension NSObject {
    class var aaClassName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

