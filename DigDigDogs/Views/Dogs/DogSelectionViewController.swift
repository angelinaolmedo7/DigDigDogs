//
//  DogSelectionViewController.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/19/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class DogSelectionViewController: UIViewController {
    
    var user: User!

    @IBOutlet weak var tableView: UITableView!
    var dogTableViewController: DogSelectionTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        dogTableViewController = DogSelectionTableViewController()
//        dogTableViewController.user = user
        
//        view.bringSubviewToFront(dogTableViewController.tableView)
        
//        tableView.dataSource = dogTableViewController
//        tableView.delegate = dogTableViewController
        
        
        tableView.register(
                    DogSelectionTableViewCell.nib,
                    forCellReuseIdentifier: DogSelectionTableViewCell.identifier
        )
        tableView.register(
                    LockedDogTableViewCell.nib,
                    forCellReuseIdentifier: LockedDogTableViewCell.identifier
        )
        
        tableView.dataSource = self
        tableView.delegate = self
                
        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DogSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.myDogs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dog = user.myDogs[indexPath.row]
        if dog.unlocked {
            let cell = tableView.dequeueReusableCell(withIdentifier: DogSelectionTableViewCell.identifier, for: indexPath) as! DogSelectionTableViewCell
            cell.setInfo(dog: dog, selected: user.activeDogs.contains(indexPath.row))
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: LockedDogTableViewCell.identifier, for: indexPath) as! LockedDogTableViewCell
            cell.setInfo(dog: dog, unlockable: user.inventory.softPriceCheck(dog: dog))
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView,
               heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dog = user.myDogs[indexPath.row]
        if dog.unlocked {
            return 100
        }
        else {
            return 150
        }

//        return (100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if user.myDogs[indexPath.row].unlocked == false {  // attempt unlock dog
            if user.inventory.purchaseDog(dog: user.myDogs[indexPath.row]) {
                user.myDogs[indexPath.row].unlocked = true
            }
            else {
                let alert = UIAlertController(title: "Insufficient resources", message: "Keep digging and try again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))

                self.present(alert, animated: true)
                print("insufficient resources")
            }
        }
        else if user.activeDogs.contains(indexPath.row) {  // dog already selected
            user.activeDogs.remove(at: user.activeDogs.firstIndex(of: indexPath.row)!)
        }
        else {
//            (self.presentingViewController as! HomeViewController).deactivateConstraints()
            if user.activeDogs.count >= 3 {
                user.activeDogs.remove(at: 0)
            }
            user.activeDogs.append(indexPath.row)
        }
        (self.presentingViewController as! HomeViewController).setUpDogs()
        (self.presentingViewController as! HomeViewController).persistence.save()
        tableView.performBatchUpdates({
            self.tableView.reloadRows(at: [indexPath], with: .none)
        })
    }
    
}
