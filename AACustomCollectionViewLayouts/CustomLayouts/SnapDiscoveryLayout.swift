//
//  SnapDiscoveryLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class SnapDiscoveryLayout: AACustomLayout {
    public init(horizontalGroupHeight: CGFloat = 270, snapCustomGroupHeight: CGFloat = 350.0) {
        let layoutGroups: [LayoutGroup] = [
            HorizontalLayoutGroup(items: 2, groupHeight: horizontalGroupHeight),
            HorizontalLayoutGroup(items: 3, groupHeight: horizontalGroupHeight),
            SnapGroupLayout(direction: .left, groupHeight: snapCustomGroupHeight),
            HorizontalLayoutGroup(items: 3, groupHeight: horizontalGroupHeight),
            SnapGroupLayout(direction: .right, groupHeight: snapCustomGroupHeight)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
