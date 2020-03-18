//
//  HomeViewController.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/17/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackground() // add background view. For now default grass.
        if user == nil {
            user = User()  // init new user object if does not already exist. This includes an inventory object and list of dogs.
        }
    }
    
    func setUpBackground(imageName: String = "bg-grass"){
        let background = UIImageView(image: UIImage(named: imageName))
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode = .scaleAspectFill
        view.addSubview(background)
        view.sendSubviewToBack(background)
        
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    @IBAction func inventoryButtonSelected(_ sender: Any) {
        var invController = InventoryViewController()
        self.view.window!.rootViewController = invController
//        self.present(invController, animated: true, completion: nil)
        
    }
    @IBAction func dogsButtonSelected(_ sender: Any) {
        var dogController = DogSelectionTableViewController()
        dogController.user = self.user
        self.present(dogController, animated: true, completion: nil)
    }
}
