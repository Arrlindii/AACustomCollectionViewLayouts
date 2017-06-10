//
//  GoldenRatioLayoutGroup.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

struct GoldenRatioLayoutGroup: LayoutGroup {
    var numberOfItems: Int
    var groupHeight: CGFloat
    
    func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect] {
        return [CGRect]()
    }
    
    init(items: Int, groupHeight: CGFloat) {
        numberOfItems = items
        self.groupHeight = groupHeight
    }
}


