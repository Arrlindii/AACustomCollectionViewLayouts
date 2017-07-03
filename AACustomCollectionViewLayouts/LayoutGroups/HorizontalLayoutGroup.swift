//
//  HorizontalLayoutGroup.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

public  struct HorizontalLayoutGroup: LayoutGroup {

    public var numberOfItems: Int
    public var groupHeight: CGFloat
    public var nextGroupStartY: CGFloat?
    
    public func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect] {
        guard numberOfItems > 0 else {return [CGRect]()}
        let itemWidth = rect.width / CGFloat(numberOfItems)
        let xOffsets: [CGFloat]  = Array(0...numberOfItems - 1).map { itemWidth*CGFloat($0) }
        return xOffsets.map {
            CGRect(x: $0, y: rect.origin.y, width: itemWidth, height: rect.height)
        }
    }
    
    public  init(items: Int, groupHeight: CGFloat) {
        numberOfItems = items
        self.groupHeight = groupHeight
    }
}
