//
//  AACustomLayout.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

public class AACustomLayout: UICollectionViewLayout {

    var layoutGroups: [LayoutGroup]
    private var lastNumberOfItems = 0
    private var currentLayoutGroupIndex = -1
    private var counter  = 0
    private var yOffset: CGFloat = 0
    public var cellPaddingX: CGFloat = 2
    public var cellPaddingY: CGFloat = 2
    private var baseWidth: CGFloat {
        return collectionView!.frame.width
    }
    private var currentLayoutGroup: LayoutGroup
    private var boundsGotChanged = false
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    fileprivate var contentHeight:CGFloat  = 0.0
    fileprivate var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    public init(layoutGroups: [LayoutGroup]) {
        self.layoutGroups = layoutGroups
        currentLayoutGroup = layoutGroups.first!
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Init with coder has not been implemented")
    }
    
    override public func prepare() {
        resetCacheIfNeeded()
        guard cache.isEmpty else {return}
        var column = 0
        for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
            if column == 0 {
                currentLayoutGroup = nextLayoutGroup()
                let blockFrame = CGRect(origin: CGPoint(x: 0, y:yOffset), size: CGSize(width: baseWidth, height: currentLayoutGroup.groupHeight))
                prepareLayoutAttributtes(usingGroup: currentLayoutGroup, startingIndex: item, rect: blockFrame)
            }
            column = (column + 1) % currentLayoutGroup.numberOfItems
        }
    }
    
    private func resetCacheIfNeeded() {
        if lastNumberOfItems != collectionView!.numberOfItems(inSection: 0) || boundsGotChanged {
            cache.removeAll()
            lastNumberOfItems = collectionView!.numberOfItems(inSection: 0)
            boundsGotChanged = false
            contentHeight = 0
            yOffset = 0
            currentLayoutGroupIndex = -1
        }
    }
    
    private func nextLayoutGroup() -> LayoutGroup {
       currentLayoutGroupIndex = (currentLayoutGroupIndex + 1) % layoutGroups.count
       return layoutGroups[currentLayoutGroupIndex]
    }
    
    private func prepareLayoutAttributtes(usingGroup group: LayoutGroup,  startingIndex item: Int, rect: CGRect)  {
        let frames = group.layoutFramesForItemsInRect(rect)
        yOffset = group.nextGroupStartY ?? frames.sorted(by: { $0.maxY >= $1.maxY }).first!.maxY
        contentHeight = max(contentHeight, yOffset)
        
        for i in 0...frames.count - 1 {
            let indexPath = IndexPath(item: item + i, section: 0)
            guard indexPath.item < collectionView!.numberOfItems(inSection: 0) else {
                break
            }
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let insetFrame = frames[i].insetBy(dx: cellPaddingX, dy: cellPaddingY)
            attributes.frame = insetFrame
            attributes.indexPath = indexPath
            cache.append(attributes)
        }
    }
    
    override public var collectionViewContentSize : CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache.filter { $0.indexPath == indexPath }.first
    }
    
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        boundsGotChanged = collectionView!.bounds != newBounds
        return boundsGotChanged
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes  in cache {
            if attributes.frame.intersects(rect ) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
}
