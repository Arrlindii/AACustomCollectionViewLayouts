//
//  BadooLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class BadooLayout: AACustomLayout {
    init(groupHeight: CGFloat = 60.0) {
        let layoutGroups: [LayoutGroup] = [
            HorizontalLayoutGroup(items: 2, groupHeight: groupHeight),
            HorizontalLayoutGroup(items: 1, groupHeight: groupHeight)
        ]
        super.init(layoutGroups: layoutGroups)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
