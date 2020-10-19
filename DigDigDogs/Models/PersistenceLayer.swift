//
//  PersistenceLayer.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/23/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
import Zephyr

struct PersistenceLayer {

    // Adapted from habitual
    private(set) var user: User!
    private static let userDefaultsKeyValue = "USER-DIGDIGDOGS"

    init() {
        self.loadUser()
    }
    
    private mutating func loadUser() {
        let userDefaults = UserDefaults.standard

        guard
            let userData = userDefaults.data(forKey: PersistenceLayer.userDefaultsKeyValue),
            let user = try? JSONDecoder().decode(User.self, from: userData) else {
                createNewUser()
                return
        }
        self.user = user
        self.user.inventory.checkAllCompliance()
    }
    
    @discardableResult
       mutating func createNewUser() -> User {

           let newUser = User()
           self.user = newUser
           self.saveUser()

           return newUser
       }
    
    private func saveUser() {
        guard let userData = try? JSONEncoder().encode(self.user) else {
            fatalError("could not encode user :(")
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(userData, forKey: PersistenceLayer.userDefaultsKeyValue)
        userDefaults.synchronize()
        Zephyr.sync(keys: ["USER-DIGDIGDOGS"])

    }
    
    mutating func reset() {
        createNewUser()
    }
    
    mutating func handleItemRoll (_ itemRoll: (dp: Int, roll: Int)) -> (String, String) {

        let rtnString = user.handleItemRoll(itemRoll)

        self.saveUser()
        return rtnString
    }
    
    mutating func setNeedsToReloadUser() {
            self.loadUser()
    }
    mutating func save() {
        self.saveUser()
    }
}
