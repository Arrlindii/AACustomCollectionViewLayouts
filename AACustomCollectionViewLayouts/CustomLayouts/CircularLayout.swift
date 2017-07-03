//
//  CircularLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

public
class CircularLayout: AACustomLayout {
    init(itemWidth: CGFloat = 95.0, itemHeight: CGFloat = 95.0, groupHeight: CGFloat = 450, numberOfItemsInGroup items: Int = 7) {
        let layoutGroups: [LayoutGroup] = [
            CircularLayoutGroup(items: items, groupHeight: groupHeight, itemWidth: itemWidth, itemHeight: itemHeight)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
