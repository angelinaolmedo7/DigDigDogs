//
//  DogSelectionTableViewCell.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/18/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class DogSelectionTableViewCell: UITableViewCell {
    
    static let identifier = "DogSelectionTableViewCell"

    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var dogBreedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dpLabel: UILabel!
    
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
    
    func setInfo (dog: Dog, selected: Bool = true) {
        if dog.unlocked {
            dogImage.image = UIImage(named: dog.image)
        }
        else {
            dogImage.image = .checkmark  // shouldn't happen
        }
        if !selected {
            dogImage.alpha = 0.5
        }
        dogBreedLabel.text = dog.breed
        nameLabel.text = dog.dogName
        dpLabel.text = "Level " + String(dog.dp)
    }
    
}
