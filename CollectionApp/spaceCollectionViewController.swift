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
        cell.labelview.text = dataItems.Name
        
        return cell
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let item = dataItem(Name: "Earth", imageName: "img07.jpeg", index: " ")
        let index = spaceItems.count
        spaceItems.append(item)
        let indexPath = IndexPath(item: index, section: 0)
        collectionView?.insertItems(at: [indexPath])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let spaceName = ["Milkyway", "Sombrero", "Sprial", "Sombrero2", "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto"]
        
        let width = collectionView!.frame.width / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
   
        for i in 1...13 {
            if i > 4 {
                spaceItems.append(dataItem(Name: "\(spaceName[i-1])" , imageName: "img0\(i).jpeg", index: "\(i)"))
            } else {
                spaceItems.append(dataItem(Name: "\(spaceName[i-1])", imageName: "images-\(i).jpeg", index: "\(i)"))
            }
        }
       
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
}
