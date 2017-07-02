//
//  LayoutGroup.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

protocol LayoutGroup {
    var numberOfItems: Int {get}
    var groupHeight: CGFloat {get}
    var nextGroupStartY: CGFloat? {get}
    
    func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect]
}
