//
//  InventoryCollectionViewCell.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/18/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class InventoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "InventoryCollectionViewCell"
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemCountLabel: UILabel!
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInfo (item: Item) {
        itemImage.image = item.image
        itemCountLabel.text = "\(item.quantity!)"
    }

}
