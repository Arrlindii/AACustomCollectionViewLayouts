//
//  CircularLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import Foundation

class CircularLayout: AACustomLayout {
    
    init() {
        let layoutGroups: [LayoutGroup] = [
            CircularLayoutGroup(items: 7, groupHeight: 450.0, itemWidth: 95.0, itemHeight: 95.0)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
