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
        self.image = "updatedDogs/\(imageName)"
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
//    "pug": Dog(breed: "Pug", name: genericDogNames.randomElement()!, imageName: "pug", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -30), PriceItem(item: defaultInventory.getItemByName(itemName: "wrapper")!)], dp: 1),
    "bc": Dog(breed: "Border Collie", name: genericDogNames.randomElement()!, imageName: "borderCollie", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -50), PriceItem(item: defaultInventory.getItemByName(itemName: "screw")!)], dp: 1),
    
    "ylab": Dog(breed: "Yellow Lab", name: genericDogNames.randomElement()!, imageName: "yellowLab", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -75), PriceItem(item: defaultInventory.getItemByName(itemName: "yellow fur")!), PriceItem(item: defaultInventory.getItemByName(itemName: "bone")!)], dp: 1),
    
    "blab": Dog(breed: "Black Lab", name: genericDogNames.randomElement()!, imageName: "blackLab", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -100), PriceItem(item: defaultInventory.getItemByName(itemName: "black fur")!), PriceItem(item: defaultInventory.getItemByName(itemName: "bone")!)], dp: 2),
    
    "clab": Dog(breed: "Chocolate Lab", name: genericDogNames.randomElement()!, imageName: "chocolateLab", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -100), PriceItem(item: defaultInventory.getItemByName(itemName: "brown fur")!), PriceItem(item: defaultInventory.getItemByName(itemName: "bone")!)], dp: 2),
    
    "gret": Dog(breed: "Golden Retriever", name: genericDogNames.randomElement()!, imageName: "goldenRetriever", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -250), PriceItem(item: defaultInventory.getItemByName(itemName: "wrapper")!), PriceItem(item: defaultInventory.getItemByName(itemName: "bottle cap")!)], dp: 2),
    
    "gshep": Dog(breed: "German Shepherd", name: genericDogNames.randomElement()!, imageName: "germanShep", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -300), PriceItem(item: defaultInventory.getItemByName(itemName: "brown fur")!), PriceItem(item: defaultInventory.getItemByName(itemName: "black fur")!, quantity: -2)], dp: 2),
    
    "samoyed": Dog(breed: "Samoyed", name: genericDogNames.randomElement()!, imageName: "samoyed", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -300), PriceItem(item: defaultInventory.getItemByName(itemName: "teddy bear")!, quantity: -2)], dp: 2),
    
    "weim": Dog(breed: "Weimaraner", name: genericDogNames.randomElement()!, imageName: "weimaraner", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -300), PriceItem(item: defaultInventory.getItemByName(itemName: "gray fur")!, quantity: -3), PriceItem(item: defaultInventory.getItemByName(itemName: "blanket")!), PriceItem(item: defaultInventory.getItemByName(itemName: "bow")!)], dp: 3),
    
    "husky": Dog(breed: "Husky", name: genericDogNames.randomElement()!, imageName: "husky", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -400), PriceItem(item: defaultInventory.getItemByName(itemName: "screw")!, quantity: -10)], dp: 3),
    
    "dalmatian": Dog(breed: "Dalmatian", name: genericDogNames.randomElement()!, imageName: "dalmatian", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -500), PriceItem(item: defaultInventory.getItemByName(itemName: "screw")!)], dp: 3),
    
    "gsp": Dog(breed: "German Shorthaired Pointer", name: genericDogNames.randomElement()!, imageName: "gsp", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -600), PriceItem(item: defaultInventory.getItemByName(itemName: "brown fur")!, quantity: -2), PriceItem(item: defaultInventory.getItemByName(itemName: "white fur")!)], dp: 3),
//    "cockerspan": Dog(breed: "Cocker Spaniel", name: genericDogNames.randomElement()!, imageName: "cockerSpaniel", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -50), PriceItem(item: defaultInventory.getItemByName(itemName: "bottle cap")!), PriceItem(item: defaultInventory.getItemByName(itemName: "brown fur")!)], dp: 2),
    
    "bullterr": Dog(breed: "Bull Terrier", name: genericDogNames.randomElement()!, imageName: "bullTerrier", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -1000), PriceItem(item: defaultInventory.getItemByName(itemName: "bone")!), PriceItem(item: defaultInventory.getItemByName(itemName: "dog tag")!), PriceItem(item: defaultInventory.getItemByName(itemName: "collar")!)], dp: 4),
    
//    "ckcspan": Dog(breed: "Cavalier King Charles Spaniel", name: "Silky", imageName: "cavalierKingCharlesSpaniel", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -500), PriceItem(item: defaultInventory.getItemByName(itemName: "bow")!), PriceItem(item: defaultInventory.getItemByName(itemName: "dog treat")!)], dp: 3),
//    "aussie": Dog(breed: "Australian Shepherd", name: "Tahoe", imageName: "tahoe", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -500), PriceItem(item: defaultInventory.getItemByName(itemName: "white fur")!), PriceItem(item: defaultInventory.getItemByName(itemName: "gray fur")!), PriceItem(item: defaultInventory.getItemByName(itemName: "black fur")!)], dp: 3),
    
    "cat": Dog(breed: "Dog?", name: "Lilac", imageName: "lilac", purchaseCost: [PriceItem(item: defaultInventory.getItemByName(itemName: "coins")!, quantity: -10000), PriceItem(item: defaultInventory.getItemByName(itemName: "twine")!), PriceItem(item: defaultInventory.getItemByName(itemName: "ribbon")!), PriceItem(item: defaultInventory.getItemByName(itemName: "fossil fish")!)], dp: 4)
]

