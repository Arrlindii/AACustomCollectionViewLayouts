//
//  IntroViewController.swift
//  AACustomCollectionViewLayouts
//
//  Created by Arlind on 6/10/17.
//  Copyright © 2017 Arlind. All rights reserved.
//

import UIKit

fileprivate struct TableDataModel {
    var name: String
    var layout: AACustomLayout
}

class IntroViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    fileprivate var dataSource: [TableDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        tableView.reloadData()
        tableView.tableFooterView = UIView()
    }
    
    private func configureDataSource() {
        dataSource = [
            TableDataModel(name: "SnapDiscoveryLayout", layout: SnapDiscoveryLayout()),
            TableDataModel(name: "CircularLayout", layout: CircularLayout()),
            TableDataModel(name: "GoldenLayout", layout: GoldenLayout()),
            TableDataModel(name: "BadooLayout", layout: BadooLayout(pictureHeight: view.frame.width * 0.3)),
            TableDataModel(name: "MixedLayot", layout: MixedLayot())
        ]
    }
    
    internal func presentStreamViewController(forLayout layout: AACustomLayout) {
        let streamVC = storyboard?.instantiateViewController(withIdentifier: StreamViewController.className) as! StreamViewController
        streamVC.currentLayout = layout
        navigationController?.pushViewController(streamVC, animated: true)
    }
}

extension IntroViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell")!
        cell.textLabel?.text = dataSource[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentStreamViewController(forLayout: dataSource[indexPath.row].layout)
    }
    
}
