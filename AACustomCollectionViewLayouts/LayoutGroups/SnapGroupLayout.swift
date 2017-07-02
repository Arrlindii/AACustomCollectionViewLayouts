//
//  SnapGroupLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

enum SnapGroupedDirection {
    case left, right
}

struct SnapGroupLayout: LayoutGroup {
    
    var numberOfItems: Int
    var direction: SnapGroupedDirection
    var groupHeight: CGFloat
    var nextGroupStartY: CGFloat?
    
    func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect] {
        return direction == .right  ? layoutFramesForItemsInRectFromRight(rect) : layoutFramesForItemsInRectFromLeft(rect)
    }
    
    private func layoutFramesForItemsInRectFromLeft(_ rect: CGRect) -> [CGRect] {
        guard numberOfItems > 0 else {return [CGRect]()}
        let itemWidths = [rect.width -  rect.width / CGFloat(numberOfItems), rect.width / CGFloat(numberOfItems), rect.width/CGFloat(numberOfItems)]
        let itemHeights = [rect.height, rect.height/2,rect.height/2]
        
        let yOffsets: [CGFloat] = [rect.origin.y, rect.origin.y, rect.origin.y  + rect.height / 2]
        let xOffsets: [CGFloat] = [rect.origin.x, rect.origin.x + 2*rect.width/CGFloat(numberOfItems) ,rect.origin.x +  2*rect.width/CGFloat(numberOfItems)]
        return Array(0...numberOfItems-1).map {
            CGRect(x: xOffsets[$0], y: yOffsets[$0], width: itemWidths[$0], height: itemHeights[$0])
        }
    }
    
    private func layoutFramesForItemsInRectFromRight(_ rect: CGRect) -> [CGRect] {
        guard numberOfItems > 0 else {return [CGRect]()}
        let itemWidths = [rect.width / CGFloat(numberOfItems), rect.width / CGFloat(numberOfItems), rect.width -  rect.width / CGFloat(numberOfItems)]
        let itemHeights = [rect.height/2,rect.height/2,rect.height]
        let yOffsets: [CGFloat] = [rect.origin.y, rect.origin.y + rect.height / 2, rect.origin.y]
        let xOffsets: [CGFloat] = [rect.origin.x, rect.origin.x, rect.origin.x + rect.width / 3]
        return Array(0...numberOfItems-1).map {
            CGRect(x: xOffsets[$0], y: yOffsets[$0], width: itemWidths[$0], height: itemHeights[$0])
        }
    }
    
    init(direction: SnapGroupedDirection, groupHeight: CGFloat) {
        numberOfItems = 3
        self.direction = direction
        self.groupHeight = groupHeight
    }
}

