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
    
    @IBOutlet weak var dogOneStackView: UIStackView!
    @IBOutlet weak var dogOneItemImage: UIImageView!
    @IBOutlet weak var dogOneItemLabel: UILabel!
    
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
            buttons[ind].heightAnchor.constraint(equalTo: buttons[ind].widthAnchor, multiplier: user.myDogs[user.activeDogs[ind]].image.size.height/user.myDogs[user.activeDogs[ind]].image.size.width).isActive = true
            buttons[ind].isHidden = false
        }
        if user.activeDogs.count < 3 {
            for ind in (user.activeDogs.count..<3){
                buttons[ind].isHidden = true
            }
        }
    }

    @IBAction func inventoryButtonSelected(_ sender: Any) {
        let invController = InventoryViewController()
        invController.user = self.user
//        self.view.window!.rootViewController = invController
        self.present(invController, animated: true, completion: nil)
        
    }
    @IBAction func dogsButtonSelected(_ sender: Any) {
        let dogController = DogSelectionViewController()
        dogController.user = self.user
        self.present(dogController, animated: true, completion: nil)
    }
    
    @IBAction func dogOnePressed(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            self.dogOneStackView.arrangedSubviews[0].isHidden = false
            self.dogOneStackView.arrangedSubviews[1].isHidden = false
        }) { (completed) in
            UIView.animate(withDuration: 0.2, delay: 0.2, options: [], animations: {
                self.dogOneStackView.arrangedSubviews[0].isHidden = true
                self.dogOneStackView.arrangedSubviews[1].isHidden = true
            }, completion: nil)
        }
    }
    @IBAction func dogTwoPressed(_ sender: Any) {
    }
    @IBAction func dogThreePressed(_ sender: Any) {
    }
}
