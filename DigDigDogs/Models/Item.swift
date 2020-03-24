//
//  Item.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/18/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
import UIKit

struct Item : Hashable, Codable{
    
    enum Rarity: String, Codable{
        case currency = "currency"
        case trash = "trash"
        case vcommon = "very common"
        case common = "common"
        case uncommon = "uncommon"
        case unusual = "unusual"
        case rare = "rare"
        case vrare = "very rare"
        case unique = "unique"
    }
    
    var name: String!
    var rarity: Rarity!
    var image: String!
    var quantity: Int!
    
    init(name: String, rarity: Rarity, imageName: String, quantity: Int = 0) {
        self.name = name
        self.rarity = rarity
        self.image = imageName
        self.quantity = quantity
    }
    
    func isSameItem(other: Item) -> Bool {
        return(other.name == self.name && other.rarity == self.rarity && other.image == self.image)
    }
}
