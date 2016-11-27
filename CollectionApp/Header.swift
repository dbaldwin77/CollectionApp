//
//  Header.swift
//  CollectionApp
//
//  Created by Developer on 11/26/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class Header: UICollectionReusableView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
