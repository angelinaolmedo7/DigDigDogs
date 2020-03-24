//
//  Inventory.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/18/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
import UIKit

class Inventory: Codable {
    var currency: [Item]
    var trashItems: [Item]
    var vCommonItems: [Item]
    var commonItems: [Item]
    var uncommonItems: [Item]
    var unusualItems: [Item]
    var rareItems: [Item]
    var vRareItems: [Item]
    
    init() {
        //set up empty inventory
        currency = [
            Item(name: "coins", rarity: .currency, imageName: "coin")
        ]
        trashItems = [
            Item(name: "bottle cap", rarity: .trash, imageName: "cap"),
            Item(name: "wrapper", rarity: .trash, imageName: "wrapper"),
//            Item(name: "can", rarity: .trash, imageName: "can")
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
    
    func addItemInCategory(rarity: Item.Rarity, quantity: Int) -> (String, String) {
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
    
    func purchaseDog(dog: Dog!) -> Bool {
        for price in dog.purchaseCost {
            if (self.getItemByName(itemName: price.item.name)?.quantity)! < (price.quantity * -1) {
                return false  // insufficient resources
            }
        }
        // sufficient resources, deduct cost
        for price in dog.purchaseCost {  // go through each category. revise later.
            self.addItemByName(itemName: price.item.name, category: &currency, quantity: price.quantity)
            self.addItemByName(itemName: price.item.name, category: &trashItems, quantity: price.quantity)
            self.addItemByName(itemName: price.item.name, category: &vCommonItems, quantity: price.quantity)
            self.addItemByName(itemName: price.item.name, category: &commonItems, quantity: price.quantity)
            self.addItemByName(itemName: price.item.name, category: &uncommonItems, quantity: price.quantity)
            self.addItemByName(itemName: price.item.name, category: &unusualItems, quantity: price.quantity)
            self.addItemByName(itemName: price.item.name, category: &rareItems, quantity: price.quantity)
            self.addItemByName(itemName: price.item.name, category: &vRareItems, quantity: price.quantity)
        }
        return true
    }
    
    func addItemByName(itemName: String, category: inout [Item], quantity: Int = 1) {
        for ind in 0..<category.count {
            if category[ind].name == itemName {
                category[ind].quantity += quantity
                return
            }
        }
    }
    
    func getItemByName(itemName: String) -> Item? {
        let items = self.getAllItems()
        for category in items {
            for item in category {
                if item.name == itemName {
                    return item
                }
            }
        }
        return nil
    }
    
    func checkAllCompliance() {
        checkCompliance(selfCategory: &self.currency, defaultCategory: defaultInventory.currency)
        checkCompliance(selfCategory: &self.vCommonItems, defaultCategory: defaultInventory.vCommonItems)
        checkCompliance(selfCategory: &self.commonItems, defaultCategory: defaultInventory.commonItems)
        checkCompliance(selfCategory: &self.uncommonItems, defaultCategory: defaultInventory.uncommonItems)
        checkCompliance(selfCategory: &self.unusualItems, defaultCategory: defaultInventory.unusualItems)
        checkCompliance(selfCategory: &self.rareItems, defaultCategory: defaultInventory.rareItems)
        checkCompliance(selfCategory: &self.vRareItems, defaultCategory: defaultInventory.vRareItems)
    }
    
    func checkCompliance(selfCategory: inout [Item], defaultCategory: [Item]) {
        for ind in selfCategory.count..<defaultCategory.count {  // add any missing new items
            selfCategory.append(defaultCategory[ind])
        }
        for ind in 0..<selfCategory.count {  // update image info for any old items
            if !selfCategory[ind].isSameItem(other: defaultCategory[ind]) {
                assert(selfCategory[ind].name == defaultCategory[ind].name, "New item added incorrectly")
                selfCategory[ind].image = defaultCategory[ind].image
            }
        }
    }
}

let defaultItem = Item(name: "ERROR", rarity: .trash, imageName: "bone")

let headerImages: [UIImage] = [
    UIImage(named: "trashLabel")!,
    UIImage(named: "vCommonLabel")!,
    UIImage(named: "commonLabel")!,
    UIImage(named: "uncommonLabel")!,
    UIImage(named: "unusualLabel")!,
    UIImage(named: "rareLabel")!,
    UIImage(named: "vRareLabel")!
]

let defaultInventory = Inventory()
