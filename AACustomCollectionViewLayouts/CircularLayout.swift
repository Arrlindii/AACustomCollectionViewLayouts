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
            CircularLayoutGroup(items: 6, groupHeight: 400.0, itemWidth: 60.0, itemHeight: 60.0)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
