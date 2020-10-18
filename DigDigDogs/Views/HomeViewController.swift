//
//  HomeViewController.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/17/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class HomeViewController: UIViewController {
    
    var persistence: PersistenceLayer!
    var user: User!
    
    @IBOutlet weak var dogOneButton: UIButton!
    @IBOutlet weak var dogTwoButton: UIButton!
    @IBOutlet weak var dogThreeButton: UIButton!
    
    @IBOutlet weak var dogOneStackView: UIStackView!
    @IBOutlet weak var dogOneItemImage: UIImageView!
    @IBOutlet weak var dogOneItemLabel: UILabel!
    
    @IBOutlet weak var dogTwoStackView: UIStackView!
    @IBOutlet weak var dogTwoItemImage: UIImageView!
    @IBOutlet weak var dogTwoItemLabel: UILabel!
    
    @IBOutlet weak var dogThreeStackView: UIStackView!
    @IBOutlet weak var dogThreeItemImage: UIImageView!
    @IBOutlet weak var dogThreeItemLabel: UILabel!
    
    var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [dogOneButton, dogTwoButton, dogThreeButton]
        persistence = PersistenceLayer()
//        persistence.reset() // reset for testing
        user = persistence.user
        setUpBackground() // add background view. For now default grass.
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
            let dogImage: UIImage! = UIImage(named: user.myDogs[user.activeDogs[ind]].image)
            buttons[ind].setImage(dogImage, for: .normal)
            buttons[ind].heightAnchor.constraint(equalTo: buttons[ind].widthAnchor, multiplier: 1).isActive = true
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
        popInOut(stack: dogOneStackView, dog: user.myDogs[user.activeDogs[0]])
        self.dogOneButton.setImage(UIImage.gif(name: "mutt-dig"), for: .normal)
    }
    @IBAction func dogTwoPressed(_ sender: Any) {
        popInOut(stack: dogTwoStackView, dog: user.myDogs[user.activeDogs[1]])
    }
    @IBAction func dogThreePressed(_ sender: Any) {
        popInOut(stack: dogThreeStackView, dog: user.myDogs[user.activeDogs[2]])
    }
    
func popInOut(stack: UIStackView!, dog: Dog!) {
    let itemString = self.persistence.handleItemRoll(dog.generateResource())
    (stack.arrangedSubviews[1] as! UILabel).text = itemString.0
    (stack.arrangedSubviews[0] as! UIImageView).image = UIImage(named: itemString.1)!
        UIView.animate(withDuration: 0.2, animations: {
            stack.arrangedSubviews[0].isHidden = false
            stack.arrangedSubviews[1].isHidden = false
        }) { (completed) in
            UIView.animate(withDuration: 0.2, delay: 0.2, options: [], animations: {
                stack.arrangedSubviews[0].isHidden = true
                stack.arrangedSubviews[1].isHidden = true
            }, completion: nil)
        }
    }
}
