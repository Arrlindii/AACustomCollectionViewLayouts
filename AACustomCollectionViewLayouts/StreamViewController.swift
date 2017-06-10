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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = Array(1...8).map {_ in ""}
        collectionView.reloadData()
        collectionView.collectionViewLayout = SnapDiscoveryLayout()
        // SnapDiscoveryLayout()
    }
}

extension StreamViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StreamCollectionViewCell", for: indexPath) as! StreamCollectionViewCell
        cell.backgroundColor = UIColor.randomColor
        return cell
    }
}

