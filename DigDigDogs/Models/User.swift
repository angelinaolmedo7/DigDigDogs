//
//  User.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/17/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
class User {
    var myDogs: [Dog]
    
    //only store the index in the myDogs list:
    var activeDogs : [Int]
    var unlockedDogs : [Int]
    var lockedDogs : [Int]
    
    // var inventory
    
    init() {
        myDogs = [dogsDict["mutt"]!, dogsDict["pug"]!, dogsDict["bc"]!, dogsDict["aussie"]!, dogsDict["cat"]!]
        activeDogs = [0]  // start with only mutt active
        unlockedDogs = [0]  // mutt is default unlocked
        lockedDogs = [1,2,3,4]  // rest are locked.
    }
}
