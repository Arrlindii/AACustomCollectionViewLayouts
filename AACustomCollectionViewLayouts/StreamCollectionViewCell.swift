//
//  StreamCollectionViewCell.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class StreamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    func makeCircular() {
        mainView.layer.cornerRadius = mainView.bounds.size.width / 2
        mainView.clipsToBounds = true
    }
    
}
