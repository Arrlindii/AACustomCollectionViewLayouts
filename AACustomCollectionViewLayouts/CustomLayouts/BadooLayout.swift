//
//  BadooLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

public  class BadooLayout: AACustomLayout {
    
    public init(pictureHeight: CGFloat, extraHeight: CGFloat = 30.0) {
        let groupHeight: CGFloat = pictureHeight + extraHeight
        let layoutGroups: [LayoutGroup] = [
            BadooGroup(groupHeight: groupHeight, itemWidth: pictureHeight)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate class BadooGroup: LayoutGroup {
    var numberOfItems: Int = 3
    var groupHeight: CGFloat
    var itemWidth: CGFloat
    var padding: CGFloat = 15.0
    var nextGroupStartY: CGFloat?
    
    func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect] {
        nextGroupStartY =  rect.origin.y + groupHeight + padding
         return [
            CGRect(x: rect.origin.x + padding, y: rect.origin.y + padding, width: itemWidth, height: groupHeight),
            CGRect(x: rect.width - itemWidth - padding, y: rect.origin.y + padding, width: itemWidth, height: groupHeight),
            CGRect(x: (rect.width - itemWidth) / 2, y: rect.origin.y + groupHeight*0.5 + padding, width: itemWidth, height: groupHeight)
        ]
    }
    
    init(groupHeight: CGFloat, itemWidth: CGFloat) {
        self.groupHeight = groupHeight
        self.itemWidth = itemWidth
    }
}

