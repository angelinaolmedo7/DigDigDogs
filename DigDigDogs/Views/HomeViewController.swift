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
    @IBOutlet weak var dogOneButton: UIButton!
    @IBOutlet weak var dogTwoButton: UIButton!
    @IBOutlet weak var dogThreeButton: UIButton!
    var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [dogOneButton, dogTwoButton, dogThreeButton]
        setUpBackground() // add background view. For now default grass.
        if user == nil {
            user = User()  // init new user object if does not already exist. This includes an inventory object and list of dogs.
        }
        setUpDogs()
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
    
    func setUpDogs() {
        for ind in (0..<user.activeDogs.count) {
            buttons[ind].setImage(user.myDogs[user.activeDogs[ind]].image, for: .normal)
            buttons[ind].isHidden = false
        }
        if user.activeDogs.count < 3 {
            for ind in (user.activeDogs.count..<3){
                buttons[ind].isHidden = true
            }
        }
    }

    @IBAction func inventoryButtonSelected(_ sender: Any) {
        var invController = InventoryViewController()
        invController.user = self.user
//        self.view.window!.rootViewController = invController
        self.present(invController, animated: true, completion: nil)
        
    }
    @IBAction func dogsButtonSelected(_ sender: Any) {
        var dogController = DogSelectionViewController()
        dogController.user = self.user
        self.present(dogController, animated: true, completion: nil)
    }
}
