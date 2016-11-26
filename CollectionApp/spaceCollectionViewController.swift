//
//  spaceCollectionViewController.swift
//  CollectionApp
//
//  Created by Developer on 11/25/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class spaceCollectionViewController: UICollectionViewController {
    
    var spaceItems = [dataItem]()
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spaceItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DataItemCell
        let dataItems = spaceItems[indexPath.row]
        cell.dataItem = dataItems
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = collectionView!.frame.width / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        for i in 1...13 {
            if i > 4 {
                spaceItems.append(dataItem(Name: "Title \(i)", imageName: "img0\(i).jpeg", index: "\(i)"))
            } else {
                spaceItems.append(dataItem(Name: "Title \(i)", imageName: "images-\(i).jpeg", index: "\(i)"))
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
}
