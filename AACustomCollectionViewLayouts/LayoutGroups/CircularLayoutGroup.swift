//
//  CircularLayoutGroup.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

public struct CircularLayoutGroup: LayoutGroup {
    
    public var numberOfItems: Int
    public var groupHeight: CGFloat
    var itemWidth: CGFloat
    var itemHeight: CGFloat
    public var nextGroupStartY: CGFloat?
    
    public  init(items: Int, groupHeight: CGFloat, itemWidth: CGFloat, itemHeight: CGFloat) {
        numberOfItems = items
        self.groupHeight = groupHeight
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
    }
    
    public func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect]  {
        var frames = [CGRect]()
        
        let angle: CGFloat = CGFloat(2 * Double.pi) / CGFloat(numberOfItems)
        let rx: CGFloat =  -CGFloat(Double.pi / 2)
        
        for i in 0...numberOfItems - 1 {
            let radius =  (rect.width - itemWidth) / 2
            let dx: CGFloat = radius  + (rect.width - 2 * radius - itemWidth) / 2
            let dy: CGFloat = radius  + (rect.height - 2 * radius - itemHeight) / 2
            
            let x =  radius * (CGFloat(cos(angle  * CGFloat(i) + rx))) + dx
            let y = radius * (CGFloat(sin(angle * CGFloat(i) + rx)))  + dy
            
            let frame = CGRect(x: x, y: y + rect.origin.y, width: itemWidth, height: itemHeight)
            frames.append(frame)
        }
        return frames
    }
}

