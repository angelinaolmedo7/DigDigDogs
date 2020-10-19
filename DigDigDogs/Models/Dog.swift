//
//  Dog.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/17/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
import UIKit

class Dog: Codable {
    var breed: String!
    var dogName: String!
    var image: String!
    var dp: Int!
    var unlocked: Bool!
    var hiddenInCrafting: Bool!
    var purchaseCost: [PriceItem]
//    var accessories: [String] = []  // add later
    
    init(breed: String, name: String, imageName: String, purchaseCost: [PriceItem], dp: Int = 0, unlocked: Bool = false, hidden: Bool = false) {
        self.breed = breed
        self.dogName = name
        self.image = imageName
        self.purchaseCost = purchaseCost
        self.dp = dp
        self.unlocked = unlocked
        self.hiddenInCrafting = hidden
    }
    
    func generateResource() -> (dp: Int, roll: Int) {
        return (dp: self.dp, roll: (Int.random(in: 1...100)))
    }
}

let genericDogNames : [String] = [
    "Max",
    "Fluffy",
    "Rufus",
    "Lily",
    "Tank",
    "Hank",
    "Dover",
    "Jack",
    "Rose",
    "Maxie",
    "Rover"
]

let dogsDict: [String: Dog] = [
    "mutt": Dog(breed: "Mutt", name: genericDogNames.randomElement()!, imageName: "mutt", purchaseCost: [], dp: 1, unlocked: true),
    "pug": Dog(breed: "Pug", name: genericDogNames.randomElement()!, imageName: "pug", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -30), PriceItem(item: defaultInventory.getItemByName(itemName: "wrapper")!)], dp: 1),
    "bc": Dog(breed: "Border Collie", name: genericDogNames.randomElement()!, imageName: "borderCollie", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -50), PriceItem(item: defaultInventory.getItemByName(itemName: "wrapper")!)], dp: 2),
    "gshep": Dog(breed: "German Shepherd", name: genericDogNames.randomElement()!, imageName: "germanShepherd", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -50), PriceItem(item: defaultInventory.getItemByName(itemName: "wrapper")!)], dp: 2),
    "bgshep": Dog(breed: "Blonde German Shepherd", name: genericDogNames.randomElement()!, imageName: "blondeGermanShepherd", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -50), PriceItem(item: defaultInventory.getItemByName(itemName: "wrapper")!)], dp: 2),
    "cockerspan": Dog(breed: "Cocker Spaniel", name: genericDogNames.randomElement()!, imageName: "cockerSpaniel", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -50), PriceItem(item: defaultInventory.getItemByName(itemName: "wrapper")!)], dp: 2),
    "bullterr": Dog(breed: "Bull Terrier", name: genericDogNames.randomElement()!, imageName: "bullTerrier", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -100), PriceItem(item: defaultInventory.getItemByName(itemName: "wrapper")!)], dp: 3),
    "ckcspan": Dog(breed: "Cavalier King Charles Spaniel", name: "Silky", imageName: "cavalierKingCharlesSpaniel", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -500), PriceItem(item: defaultInventory.getItemByName(itemName: "bow")!), PriceItem(item: defaultInventory.getItemByName(itemName: "dog treat")!)], dp: 3),
    "aussie": Dog(breed: "Australian Shepherd", name: "Tahoe", imageName: "tahoe", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -500), PriceItem(item: defaultInventory.getItemByName(itemName: "white fur")!), PriceItem(item: defaultInventory.getItemByName(itemName: "gray fur")!), PriceItem(item: defaultInventory.getItemByName(itemName: "black fur")!)], dp: 3),
    "cat": Dog(breed: "Dog?", name: "Lilac", imageName: "lilac", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -1000), PriceItem(item: defaultInventory.getItemByName(itemName: "wrapper")!)], dp: 4)
]

