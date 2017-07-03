//
//  GoldenRatioLayoutGroup.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

public class GoldenRatioLayoutGroup: LayoutGroup {

    public var numberOfItems: Int
    public var groupHeight: CGFloat
    public var nextGroupStartY: CGFloat?
    private var iteration: Int
    
    public func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect] {
        var frames = [CGRect]()
        var xOffset: [CGFloat] = [rect.origin.x , rect.size.width * CGFloat.aaFibConstant + rect.origin.x]
        var yOffset = [CGFloat](repeating: rect.origin.y, count: numberOfItems)
        
        if rect.height > rect.width  {
            xOffset = [CGFloat](repeating: rect.origin.x, count: numberOfItems)
            yOffset = [rect.origin.y, rect.size.height * CGFloat.aaFibConstant + rect.origin.y]
        }
        
        for column in 0...1 {
            var width = rect.width * CGFloat.aaFibConstant
            if column == 1 {
                width *= CGFloat.aaFibConstant
            }
            
            var height = rect.height
            
            if rect.height > rect.width  {
                width = rect.width
                
                height = rect.height * CGFloat.aaFibConstant
                if column == 1 {
                    height *= CGFloat.aaFibConstant
                }
            }
            
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: width, height: height)
            frames.append(frame)
        }
        
        iteration -= 1
        
        if iteration == 0 {
            iteration = numberOfItems - 1
            return frames
        } else {
            var a: [CGRect] = [frames[0]]
            a.append(contentsOf: layoutFramesForItemsInRect(frames.last!))
            return a
        }
    }
    
    public init(items: Int, groupHeight: CGFloat) {
        numberOfItems = items
        self.groupHeight = groupHeight
        iteration = numberOfItems - 1
    }
}


