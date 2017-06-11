//
//  GoldenLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class GoldenLayout: AACustomLayout {
    init() {
        let layoutGroups: [LayoutGroup] = [
            GoldenRatioLayoutGroup(items: 5, groupHeight: 350.0)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
