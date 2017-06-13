//
//  BadooLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class BadooLayout: AACustomLayout {
    
    init(pictureHeight: CGFloat, extraHeight: CGFloat = 30.0) {
        let groupHeight: CGFloat = pictureHeight + extraHeight
        let layoutGroups: [LayoutGroup] = [
            BadooGroup(groupHeight: groupHeight, itemWidth: pictureHeight)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate class BadooGroup: LayoutGroup {
    var numberOfItems: Int = 3
    var groupHeight: CGFloat
    var itemWidth: CGFloat
    var padding: CGFloat = 15.0
    
    func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect] {
        let y: CGFloat =  rect.origin.y + groupHeight*0.5
        return [
            CGRect(x: rect.origin.x + padding, y: rect.origin.y, width: itemWidth, height: groupHeight),
            CGRect(x: rect.width - itemWidth - padding, y: rect.origin.y, width: itemWidth, height: groupHeight),
            CGRect(x: (rect.width - itemWidth) / 2, y: y, width: itemWidth, height: groupHeight)
        ]
    }
    
    init(groupHeight: CGFloat, itemWidth: CGFloat) {
        self.groupHeight = groupHeight
        self.itemWidth = itemWidth
    }
}

