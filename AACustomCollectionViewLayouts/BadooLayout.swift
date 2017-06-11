//
//  BadooLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class BadooLayout: AACustomLayout {
    
    init(groupHeight: CGFloat = 110.0) {
        let layoutGroups: [LayoutGroup] = [
            CustomLayout(groupHeight: groupHeight, itemWidth: groupHeight),
            HorizontalLayoutGroup(items: 1, groupHeight: groupHeight / 3)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

fileprivate class CustomLayout: LayoutGroup {
    var numberOfItems: Int = 2
    var groupHeight: CGFloat
    var itemWidth: CGFloat
    var padding: CGFloat = 15.0
    
    func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect] {
        return [
            CGRect(x: rect.origin.x + padding, y: rect.origin.y + padding, width: itemWidth, height: groupHeight),
            CGRect(x: rect.width - itemWidth - padding, y: rect.origin.y + padding, width: itemWidth, height: groupHeight)
        ]
    }
    
    init(groupHeight: CGFloat, itemWidth: CGFloat) {
        self.groupHeight = groupHeight
        self.itemWidth = itemWidth
    }
}
