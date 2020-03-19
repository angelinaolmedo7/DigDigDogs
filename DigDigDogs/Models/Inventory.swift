//
//  Inventory.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/18/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation

let currencyNames : [String] = ["coins"]
let trashItemNames : [String] = ["bottle cap", "wrapper", "can"]
let vCommonItemNames : [String] = ["twine", "screw", "bone"]
let commonItemNames : [String] = ["black fur", "gray fur", "white fur", "yellow fur", "brown fur"]
let uncommonItemNames : [String] = ["dog tag", "collar", "leash"]
let unusualItemNames : [String] = ["blanket", "bow", "dog treat"]
let rareItemNames : [String] = ["ribbon", "teddy bear"]
let vRareItemNames : [String] = ["fossil plant", "fossil dino", "fossil fish"]

class Inventory {
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
    
    func getAllItems(withCurrency: Bool = false) -> [[Item]]{
        var allItems: [[Item]] = [trashItems, vCommonItems, commonItems, uncommonItems, unusualItems, rareItems, vRareItems]
        if withCurrency {
            allItems.insert(currency, at: 0)
        }
        return allItems
    }
}
