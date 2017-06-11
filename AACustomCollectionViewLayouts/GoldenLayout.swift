//
//  GoldenLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class GoldenLayout: AACustomLayout {
    init(items: Int = 5, groupHeight: CGFloat = 350.0) {
        let layoutGroups: [LayoutGroup] = [
            GoldenRatioLayoutGroup(items: items, groupHeight: groupHeight)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
