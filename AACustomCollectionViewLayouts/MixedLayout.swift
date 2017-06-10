//
//  MixedLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit 

class MixedLayot: AACustomLayout {
    private let horizontalGroupHeight: CGFloat = 270
    private let snapCustomGroupHeight: CGFloat = 350.0
    
    init() {
        let layoutGroups: [LayoutGroup] = [
            HorizontalLayoutGroup(items: 2, groupHeight: horizontalGroupHeight)
            ,CircularLayoutGroup(items: 6, groupHeight: 200, itemWidth: 40.0, itemHeight: 40.0)
            ,HorizontalLayoutGroup(items: 5, groupHeight: horizontalGroupHeight)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
