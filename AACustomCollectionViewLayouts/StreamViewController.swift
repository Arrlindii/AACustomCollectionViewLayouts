//
//  ViewController.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

class StreamViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: [String] = []
    var  currentLayout: AACustomLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = Array(1...32).map {"\($0)"}
        collectionView.reloadData()
        collectionView.collectionViewLayout = currentLayout
    }
}

extension StreamViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier =  currentLayout is BadooLayout || currentLayout is CircularLayout ? "roundedCell" : "StreamCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StreamCollectionViewCell
        cell.mainView.backgroundColor = UIColor.randomColor
        cell.titleLabel?.text = dataSource[indexPath.item]
        cell.imageView?.image = UIImage(named:  dataSource[indexPath.item])
        cell.makeRounded()
        return cell
    }
}

