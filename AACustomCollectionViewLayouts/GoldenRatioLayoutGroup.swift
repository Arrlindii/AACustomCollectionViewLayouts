//
//  GoldenRatioLayoutGroup.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class GoldenRatioLayoutGroup: LayoutGroup {
    var numberOfItems: Int
    var groupHeight: CGFloat
    private var iteration: Int
    
    func layoutFramesForItemsInRect(_ rect: CGRect) -> [CGRect] {
        var frames = [CGRect]()
        var xOffset: [CGFloat] = [rect.origin.x , rect.size.width * CGFloat.fibConstant + rect.origin.x]
        var yOffset = [CGFloat](repeating: rect.origin.y, count: numberOfItems)
        
        if rect.height > rect.width  {
            xOffset = [CGFloat](repeating: rect.origin.x, count: numberOfItems)
            yOffset = [rect.origin.y, rect.size.height * CGFloat.fibConstant + rect.origin.y]
        }
        
        for column in 0...1 {
            var width = rect.width * CGFloat.fibConstant
            if column == 1 {
                width *= CGFloat.fibConstant
            }
            
            var height = rect.height
            
            if rect.height > rect.width  {
                width = rect.width
                
                height = rect.height * CGFloat.fibConstant
                if column == 1 {
                    height *= CGFloat.fibConstant
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
    
    init(items: Int, groupHeight: CGFloat) {
        numberOfItems = items
        self.groupHeight = groupHeight
        iteration = numberOfItems - 1
    }
}


