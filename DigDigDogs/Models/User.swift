//
//  User.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/17/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
import UIKit

class User: Codable {
    var myDogs: [Dog]
    
    //only store the index in the myDogs list:
    var activeDogs : [Int]
    var unlockedDogs : [Int]
    var lockedDogs : [Int]
    
    var inventory : Inventory!
    
    init() {
        myDogs = [
            dogsDict["mutt"]!,
            dogsDict["bc"]!,
            dogsDict["ylab"]!,
            dogsDict["blab"]!,
            dogsDict["clab"]!,
            dogsDict["gret"]!,
            dogsDict["samoyed"]!,
            dogsDict["gshep"]!,
            dogsDict["gsp"]!,
            dogsDict["weim"]!,
            dogsDict["husky"]!,
            dogsDict["bullterr"]!,
            dogsDict["dalmatian"]!,
            dogsDict["cat"]!]
        
        activeDogs = [0]  // start with only mutt active
        unlockedDogs = [0]  // mutt is default unlocked
        lockedDogs = Array(1..<myDogs.count)  // rest are locked.
        
        inventory = Inventory()
    }
    
    func handleItemRoll (_ itemRoll: (dp: Int, roll: Int)) -> (String, String) {
        // Make sure inv exists
        guard self.inventory != nil else {
            return (defaultItem.name, defaultItem.image)
        }
        // Determine item
//        print(itemRoll.dp)
        var newItem: (itmName:(String, String), quantity:Int) = ((defaultItem.name, defaultItem.image), 1)  // name should be overwritten
        if itemRoll.roll <= 30 {  // 30% coins
            let coins = calcCoins(exponent(base: 2, exp: itemRoll.dp))
            newItem.itmName = inventory.addItemInCategory(rarity: .currency, quantity: coins)
            newItem.quantity = coins
        }
        else {
            if itemRoll.dp == 1 {
                if itemRoll.roll <= 60 {  // 30% trash
                    newItem.itmName = inventory.addItemInCategory(rarity: .trash, quantity: 1)
                }
                else if itemRoll.roll <= 88 {  // 28% very common
                    newItem.itmName = inventory.addItemInCategory(rarity: .vcommon, quantity: 1)
                }
                else if itemRoll.roll <= 97 { // 9% common
                    newItem.itmName = inventory.addItemInCategory(rarity: .common, quantity: 1)
                }
                else if itemRoll.roll <= 99  { // 2% uncommon
                    newItem.itmName = inventory.addItemInCategory(rarity: .uncommon, quantity: 1)
                }
                else { // 1% unusual
                    newItem.itmName = inventory.addItemInCategory(rarity: .unusual, quantity: 1)
                }
            }
            else if itemRoll.dp == 2 {
                if itemRoll.roll <= 45 {  // trash
                    newItem.itmName = inventory.addItemInCategory(rarity: .trash, quantity: 1)
                }
                else if itemRoll.roll <= 55 {  // very common
                    newItem.itmName = inventory.addItemInCategory(rarity: .vcommon, quantity: 1)
                }
                else if itemRoll.roll <= 70 {  // common
                    newItem.itmName = inventory.addItemInCategory(rarity: .common, quantity: 1)
                }
                else if itemRoll.roll <= 85  {  // uncommon
                    newItem.itmName = inventory.addItemInCategory(rarity: .uncommon, quantity: 1)
                }
                else if itemRoll.roll <= 95  {  // unusual
                    newItem.itmName = inventory.addItemInCategory(rarity: .unusual, quantity: 1)
                }
                else {  // rare
                    newItem.itmName = inventory.addItemInCategory(rarity: .rare, quantity: 1)
                }
            }
            else if itemRoll.dp == 3 {
                if itemRoll.roll <= 35 {  // trash
                    newItem.itmName = inventory.addItemInCategory(rarity: .trash, quantity: 1)
                }
                else if itemRoll.roll <= 40 {  // very common
                    newItem.itmName = inventory.addItemInCategory(rarity: .vcommon, quantity: 1)
                }
                else if itemRoll.roll <= 50 {  // common
                    newItem.itmName = inventory.addItemInCategory(rarity: .common, quantity: 1)
                }
                else if itemRoll.roll <= 65  {  // uncommon
                    newItem.itmName = inventory.addItemInCategory(rarity: .uncommon, quantity: 1)
                }
                else if itemRoll.roll <= 85  {  // unusual
                    newItem.itmName = inventory.addItemInCategory(rarity: .unusual, quantity: 1)
                }
                else if itemRoll.roll <= 95  {  // rare
                    newItem.itmName = inventory.addItemInCategory(rarity: .rare, quantity: 1)
                }
                else {  // very rare
                    newItem.itmName = inventory.addItemInCategory(rarity: .vrare, quantity: 1)
                }
            }
            else if itemRoll.dp == 4 {
                if itemRoll.roll <= 35 {  // trash
                    newItem.itmName = inventory.addItemInCategory(rarity: .trash, quantity: 1)
                }
                else if itemRoll.roll <= 36 {  // very common
                    newItem.itmName = inventory.addItemInCategory(rarity: .vcommon, quantity: 1)
                }
                else if itemRoll.roll <= 40 {  // common
                    newItem.itmName = inventory.addItemInCategory(rarity: .common, quantity: 1)
                }
                else if itemRoll.roll <= 50  {  // uncommon
                    newItem.itmName = inventory.addItemInCategory(rarity: .uncommon, quantity: 1)
                }
                else if itemRoll.roll <= 73  {  // unusual
                    newItem.itmName = inventory.addItemInCategory(rarity: .unusual, quantity: 1)
                }
                else if itemRoll.roll <= 90  {  // rare
                    newItem.itmName = inventory.addItemInCategory(rarity: .rare, quantity: 1)
                }
                else {  // very rare
                    newItem.itmName = inventory.addItemInCategory(rarity: .vrare, quantity: 1)
                }
            }
            else {  // this... shouldn't happen.
                newItem = ((defaultItem.name, defaultItem.image), 0)
            }
        }
        
        // Add quantity of item to proper dict value
        return ("+\(newItem.quantity) \(newItem.itmName.0)", newItem.itmName.1)
    }
    
    func calcCoins (_ multiplyer: Int) -> Int {
        return Int.random(in: 1...20)*multiplyer
    }
    
    func exponent(base: Int, exp: Int) -> Int {
        if exp == 0 {
            return 1
        }
        var result: Int = 1
        for _ in 1 ... exp {
            result *= base
        }
        return result
    }
}
