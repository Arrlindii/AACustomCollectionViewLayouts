//
//  AACustomLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class AACustomLayout: UICollectionViewLayout {

    var layoutGroups: [LayoutGroup]
    private var currentLayoutGroupIndex = 0
    private var values: [Int] = []
    private var counter  = 0
    private var yOffset: CGFloat = 0
    private var cellPadding: CGFloat = 2
    private var baseWidth: CGFloat {
        return collectionView!.frame.width
    }
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentHeight:CGFloat  = 0.0
    fileprivate var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    init(layoutGroups: [LayoutGroup]) {
        self.layoutGroups = layoutGroups
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.layoutGroups = [LayoutGroup]()
        super.init(coder: aDecoder)
    }
    
    override func prepare() {
        if cache.isEmpty {
            var column = 0
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                let layoutGroup = currentLayoutGroup()
                if column == 0 {
                    let blockFrame = CGRect(origin: CGPoint(x: 0, y:yOffset), size: CGSize(width: baseWidth, height: layoutGroup.groupHeight))
                    prepareLayoutAttributtes(usingGroup: layoutGroup, startingIndex: item, rect: blockFrame)
                }
                column = column >= layoutGroup.numberOfItems - 1 ? 0 : column + 1
            }
        }
    }

    private func currentLayoutGroup() ->  LayoutGroup {
        if layoutGroups[currentLayoutGroupIndex].numberOfItems == counter {
            counter = 0
            currentLayoutGroupIndex = (currentLayoutGroupIndex + 1) % layoutGroups.count
            return layoutGroups[currentLayoutGroupIndex]
        }
        counter += 1
        return layoutGroups[currentLayoutGroupIndex]
    }
    
    private func prepareLayoutAttributtes(usingGroup group: LayoutGroup,  startingIndex item: Int, rect: CGRect)  {
        let frames = group.layoutFramesForItemsInRect(rect)
        yOffset = frames.sorted(by: { $0.maxY >= $1.maxY }).first!.maxY
        contentHeight = max(contentHeight, yOffset)
        
        for i in 0...frames.count - 1 {
            let indexPath = IndexPath(item: item + i, section: 0)
            guard indexPath.item < collectionView!.numberOfItems(inSection: 0) else {
                break
            }
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frames[i]
            attributes.indexPath = indexPath
            cache.append(attributes)
        }
    }
    
    override var collectionViewContentSize : CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache.filter { $0.indexPath == indexPath }.first
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes  in cache {
            if attributes.frame.intersects(rect ) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
}
