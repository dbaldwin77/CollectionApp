//
//  spaceCollectionViewController.swift
//  CollectionApp
//
//  Created by Developer on 11/25/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class spaceCollectionViewController: UICollectionViewController {
    
    var data = DataItemCell()
    var spaceItems = [dataItem]()
    
    @IBOutlet weak var addbutton: UIBarButtonItem!
    
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
        cell.editing = isEditing
        
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
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationController?.isToolbarHidden = true
        
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
    
    @IBAction func deleteButton(_ sender: UIBarButtonItem) {
     
        let indexPaths = collectionView!.indexPathsForSelectedItems!
        
          spaceItems.remove(at: 0)
        
        
        collectionView?.deleteItems(at: indexPaths as [IndexPath])
     
    
     
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        addbutton.isEnabled = !editing
        
        collectionView!.allowsMultipleSelection = editing
        let indexPaths = collectionView!.indexPathsForVisibleItems as [NSIndexPath]
        
        for IndexPath in indexPaths {
            collectionView!.deselectItem(at: IndexPath as IndexPath, animated: false)
            let cell = collectionView!.cellForItem(at: IndexPath as IndexPath) as! DataItemCell
            cell.editing = editing
        }
        
        if !editing {
            navigationController!.setToolbarHidden(true, animated: animated)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
       
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isEditing {
        navigationController!.setToolbarHidden(false, animated: true)
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if isEditing {
            if collectionView.indexPathsForSelectedItems?.count == 0 {
                
            navigationController?.setToolbarHidden(true, animated: true)
            }
        }
    }
 }
