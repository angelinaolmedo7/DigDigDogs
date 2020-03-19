//
//  LockedDogTableViewCell.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/19/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class LockedDogTableViewCell: UITableViewCell {
    
    static let identifier = "LockedDogTableViewCell"

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo (dog: Dog) {

    }
    
}
