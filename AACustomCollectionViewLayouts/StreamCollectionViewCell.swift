//
//  StreamCollectionViewCell.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class StreamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var mainView: UIView!
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainView.layer.cornerRadius = mainView.bounds.size.width / 2
    }
}
