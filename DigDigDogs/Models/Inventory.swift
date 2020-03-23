//
//  Inventory.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/18/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
import UIKit

class Inventory {
    var currency: [Item]
    var trashItems: [Item]
    var vCommonItems: [Item]
    var commonItems: [Item]
    var uncommonItems: [Item]
    var unusualItems: [Item]
    var rareItems: [Item]
    var vRareItems: [Item]
    
    let headerImages: [UIImage] = [
        UIImage(named: "trashLabel")!,
        UIImage(named: "vCommonLabel")!,
        UIImage(named: "commonLabel")!,
        UIImage(named: "uncommonLabel")!,
        UIImage(named: "unusualLabel")!,
        UIImage(named: "rareLabel")!,
        UIImage(named: "vRareLabel")!
    ]
    
    init() {
        //set up empty inventory
        currency = [
            Item(name: "coins", rarity: .currency, imageName: "can")  //shouldn't need an image for now
        ]
        trashItems = [
            Item(name: "bottle cap", rarity: .trash, imageName: "cap"),
            Item(name: "wrapper", rarity: .trash, imageName: "wrapper"),
            Item(name: "can", rarity: .trash, imageName: "can")
        ]
        vCommonItems = [
            Item(name: "twine", rarity: .vcommon, imageName: "twine"),
            Item(name: "screw", rarity: .vcommon, imageName: "screw"),
            Item(name: "bone", rarity: .vcommon, imageName: "bone")
        ]
        commonItems = [
            Item(name: "black fur", rarity: .common, imageName: "blackFur"),
            Item(name: "gray fur", rarity: .common, imageName: "grayFur"),
            Item(name: "white fur", rarity: .common, imageName: "whiteFur"),
            Item(name: "yellow fur", rarity: .common, imageName: "yellowFur"),
            Item(name: "brown fur", rarity: .common, imageName: "brownFur")
        ]
        uncommonItems = [
            Item(name: "dog tag", rarity: .uncommon, imageName: "dogTag"),
            Item(name: "collar", rarity: .uncommon, imageName: "collar"),
            Item(name: "leash", rarity: .uncommon, imageName: "leash"),
        ]
        unusualItems = [
            Item(name: "blanket", rarity: .unusual, imageName: "blanket"),
            Item(name: "bow", rarity: .unusual, imageName: "bow"),
            Item(name: "dog treat", rarity: .unusual, imageName: "dogTreat")
        ]
        rareItems = [
            Item(name: "ribbon", rarity: .rare, imageName: "ribbon"),
            Item(name: "teddy bear", rarity: .rare, imageName: "teddyBear")
        ]
        vRareItems = [
            Item(name: "fossil plant", rarity: .vrare, imageName: "fossilPlant"),
            Item(name: "fossil dino", rarity: .vrare, imageName: "fossilDino"),
            Item(name: "fossil fish", rarity: .vrare, imageName: "fossilFish")
        ]
    }
    
    func getAllItems(withCurrency: Bool = false) -> [[Item]] {
        var allItems: [[Item]] = [trashItems, vCommonItems, commonItems, uncommonItems, unusualItems, rareItems, vRareItems]
        if withCurrency {
            allItems.insert(currency, at: 0)
        }
        return allItems
    }
    
    func addItemInCategory(rarity: Item.Rarity, quantity: Int) -> (String, UIImage) {
        if rarity == .currency {
            self.currency[0].quantity += quantity
            return (currency[0].name, currency[0].image)
        }
        else if rarity == .trash {
            let roll = Int.random(in: 0..<self.trashItems.count)
            self.trashItems[roll].quantity += quantity
            return (trashItems[roll].name, trashItems[roll].image)
        }
        else if rarity == .vcommon {
            let roll = Int.random(in: 0..<self.vCommonItems.count)
            self.vCommonItems[roll].quantity += quantity
            return (vCommonItems[roll].name, vCommonItems[roll].image)
        }
        else if rarity == .common {
            let roll = Int.random(in: 0..<self.commonItems.count)
            self.commonItems[roll].quantity += quantity
            return (commonItems[roll].name, commonItems[roll].image)
        }
        else if rarity == .uncommon {
            let roll = Int.random(in: 0..<self.uncommonItems.count)
            self.uncommonItems[roll].quantity += quantity
            return (uncommonItems[roll].name, uncommonItems[roll].image)
        }
        else if rarity == .unusual {
            let roll = Int.random(in: 0..<self.unusualItems.count)
            self.unusualItems[roll].quantity += quantity
            return (unusualItems[roll].name, unusualItems[roll].image)
        }
        else if rarity == .rare {
            let roll = Int.random(in: 0..<self.rareItems.count)
            self.rareItems[roll].quantity += quantity
            return (rareItems[roll].name, rareItems[roll].image)
        }
        else if rarity == .vrare {
            let roll = Int.random(in: 0..<self.vRareItems.count)
            self.vRareItems[roll].quantity += quantity
            return (vRareItems[roll].name, vRareItems[roll].image)
        }
        else {
            return (defaultItem.name, defaultItem.image)
        }
    }
}

let defaultItem = Item(name: "ERROR", rarity: .trash, imageName: "bone")
