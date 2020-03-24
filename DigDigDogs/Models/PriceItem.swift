//
//  PriceItem.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/24/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
struct PriceItem: Codable {
    var item: Item
    var quantity: Int
    init(item: Item, quantity: Int = -1) {
        self.item = item
        self.quantity = quantity
    }
}
