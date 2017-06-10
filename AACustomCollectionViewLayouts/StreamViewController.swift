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
        dataSource = Array(1...50).map {_ in ""}
        collectionView.reloadData()
        configureCollectionViewLayout()
    }
    
    private func configureCollectionViewLayout() {
        collectionView.collectionViewLayout = SnapDiscoveryLayout()
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


//let layoutGroups = [SnapGroupLayout(direction: .left, groupHeight: 350.0)]
//            CircularLayoutGroup(items: 8, groupHeight: 400.0, itemWidth: 80.0, itemHeight: 80.0)
//                                            HorizontalLayoutGroup(items: 1, groupHeight: 300.0),
//                                            HorizontalLayoutGroup(items: 2, groupHeight: 270.0)
//                                            HorizontalLayoutGroup(items: 3, groupHeight: 420.0),
//                                            HorizontalLayoutGroup(items: 5, groupHeight: 200.0),

//                                            SnapyGroupedHorizontaLayout(direction: .left, groupHeight: 350.0)
//                                            HorizontalLayoutGroup(items: 3, groupHeight: 200.0),
//                                            SnapyGroupedHorizontaLayout(direction: .right, groupHeight: 350.0)
//        ]


//        let collectionViewLayout = AACustomLayout(layoutGroups: layoutGroups)
