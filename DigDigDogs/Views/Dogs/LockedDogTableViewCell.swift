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
    
//    Up to six items displayed
    @IBOutlet weak var itemOneImage: UIImageView!
    @IBOutlet weak var itemOneLabel: UILabel!
    
    @IBOutlet weak var itemTwoImage: UIImageView!
    @IBOutlet weak var itemTwoLabel: UILabel!
    
    @IBOutlet weak var itemThreeImage: UIImageView!
    @IBOutlet weak var itemThreeLabel: UILabel!
    
    @IBOutlet weak var itemFourImage: UIImageView!
    @IBOutlet weak var itemFourLabel: UILabel!
    
    @IBOutlet weak var itemFiveImage: UIImageView!
    @IBOutlet weak var itemFiveLabel: UILabel!
    
    @IBOutlet weak var itemSixLabel: UILabel!
    @IBOutlet weak var itemSixImage: UIImageView!
    
    var itemImages: [UIImageView]!
    var itemLabels: [UILabel]!
        
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemImages = [itemOneImage, itemTwoImage, itemThreeImage,
                      itemFourImage, itemFiveImage, itemSixImage]
        itemLabels = [itemOneLabel, itemTwoLabel, itemThreeLabel,
                      itemFourLabel, itemFiveLabel, itemSixLabel]

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo (dog: Dog) {
        // the following was for condensing the cost into one string
        
//        var priceString: String = "Cost: "
//        for item in dog.purchaseCost {
//            priceString += "\(String(item.quantity * -1)) \(item.item.name!), "
//        }
//        priceString.removeLast(2)
        
        // reset to blank
        for itemImage in self.itemImages {
            itemImage.isHidden = true
        }
        for itemLabel in self.itemLabels {
            itemLabel.isHidden = true
        }
        
        // populate with items
        for ind in (0..<dog.purchaseCost.count) {
            self.itemImages[ind].image = dog.purchaseCost[ind].item.getUIImage()
            self.itemLabels[ind].text = "\(dog.purchaseCost[ind].quantity)"
            self.itemLabels[ind].textColor = .white
            self.itemImages[ind].isHidden = false
            self.itemLabels[ind].isHidden = false
        }

    }
    
}
