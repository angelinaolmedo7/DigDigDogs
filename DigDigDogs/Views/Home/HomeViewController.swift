//
//  HomeViewController.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/17/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit
//import SwiftGifOrigin
//import Zephyr

class HomeViewController: UIViewController {
    
    var persistence: PersistenceLayer!
    var user: User!
    
    @IBOutlet weak var dogOneButton: UIButton!
    @IBOutlet weak var dogTwoButton: UIButton!
    @IBOutlet weak var dogThreeButton: UIButton!
    
    var dogOneReady: Bool = true
    var dogTwoReady: Bool = true
    var dogThreeReady: Bool = true
    
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
//        Zephyr.debugEnabled = true
//        Zephyr.sync(keys: ["USER-DIGDIGDOGS"])
        
        
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
//            var dogImage: UIImage? = UIImage(named: "\(user.myDogs[user.activeDogs[ind]].image ?? "mutt")-full")
//            if dogImage == nil {  // no animation exists yet
//                dogImage = UIImage(named: user.myDogs[user.activeDogs[ind]].image)
//            }
            let dogImage: UIImage? = UIImage(named: user.myDogs[user.activeDogs[ind]].image ?? "mutt")
            buttons[ind].setImage(dogImage, for: .normal)
            buttons[ind].heightAnchor.constraint(equalTo: buttons[ind].widthAnchor, multiplier: 1).isActive = true
            buttons[ind].imageView?.contentMode = .scaleAspectFit

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
    
    @IBAction func dogOnePressed(_ sender: UIButton) {
        if dogOneReady {
            dogOneReady = false
            popInOut(stack: dogOneStackView, dog: user.myDogs[user.activeDogs[0]], readyVar: ({ void in
                self.dogOneReady = true
            }))
    //        let gif = UIImage.gif(name: "mutt-dig")
    //        self.dogOneButton.setImage(gif, for: .normal)
    //        DispatchQueue.main.asyncAfter(deadline: .now() + (gif?.duration ?? 1)) {
    //            self.dogOneButton.setImage(UIImage(named: "mutt-full"), for: .normal)
    //        }
            dogBounce(button: sender)
        }
    }
    @IBAction func dogTwoPressed(_ sender: UIButton) {
        if dogTwoReady {
            dogTwoReady = false
            popInOut(stack: dogTwoStackView, dog: user.myDogs[user.activeDogs[1]], readyVar: ({ void in
                self.dogTwoReady = true
            }))
            dogBounce(button: sender)
        }
    }
    @IBAction func dogThreePressed(_ sender: UIButton) {
        if dogThreeReady {
            dogThreeReady = false
            popInOut(stack: dogThreeStackView, dog: user.myDogs[user.activeDogs[2]], readyVar: ({ void in
                self.dogThreeReady = true
            }))
            dogBounce(button: sender)
        }
    }
    
    func dogBounce(button: UIButton) {
        button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 1.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(3.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                        button.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
    }
    
    func popInOut(stack: UIStackView!, dog: Dog!, readyVar: @escaping ((Bool) -> Void)) {
    let itemString = self.persistence.handleItemRoll(dog.generateResource())
    (stack.arrangedSubviews[1] as! UILabel).text = itemString.0
    (stack.arrangedSubviews[0] as! UIImageView).image = UIImage(named: itemString.1)!
//        UIView.animate(withDuration: 0.2, animations: {
//            stack.arrangedSubviews[0].isHidden = false
//            stack.arrangedSubviews[1].isHidden = false
//        }) { (completed) in
//            UIView.animate(withDuration: 0.2, delay: 0.2, options: [], animations: {
//                stack.arrangedSubviews[0].isHidden = true
//                stack.arrangedSubviews[1].isHidden = true
//            }, completion: nil)
//        }
    stack.alpha = 0
    stack.arrangedSubviews[0].isHidden = false
    stack.arrangedSubviews[1].isHidden = false
    stack.fadeIn(completion: {
            (finished: Bool) -> Void in
        stack.fadeOut(completion: readyVar)
            })
    }
}

extension UIView {

    func fadeIn(duration: TimeInterval = 0.3, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }

    func fadeOut(duration: TimeInterval = 0.3, delay: TimeInterval = 0.2, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }

}
