//
//  dataSource.swift
//  CollectionApp
//
//  Created by Developer on 11/25/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class DataItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var dataItemImageView: UIImageView!
    
    @IBOutlet weak var uncheckedRadio: UIImageView!
    
    @IBOutlet weak var labelview: UILabel!
    
    var dataItem: dataItem? {
        didSet {
            if let dataItem = dataItem {
                dataItemImageView.image = UIImage(named: dataItem.imageName)
            }
        }
    }
    var editing:Bool = false {
        didSet {
            labelview.isHidden = editing
            uncheckedRadio.isHidden = !editing
        }
    }
    override var isSelected: Bool {
        didSet {
            if editing {
                uncheckedRadio.image = UIImage(named: isSelected ? "checked" : "unchecked")
            }
        }
    }
}
