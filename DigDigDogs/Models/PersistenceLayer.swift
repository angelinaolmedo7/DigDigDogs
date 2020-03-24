//
//  PersistenceLayer.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/23/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation

struct PersistenceLayer {

    // Adapted from habitual
    private(set) var user: User!
    private static let userDefaultsKeyValue = "USER"

    init() {
        print("loading user")
        self.loadUser()
    }
    
    private mutating func loadUser() {
        let userDefaults = UserDefaults.standard

        guard
            let userData = userDefaults.data(forKey: PersistenceLayer.userDefaultsKeyValue),
            let user = try? JSONDecoder().decode(User.self, from: userData) else {
                print("making new user")
                createNewUser()
                return
        }
        self.user = user
        print(self.user.activeDogs)
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

    }
    
    mutating func delete() {
        // don't do anything, yet
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
