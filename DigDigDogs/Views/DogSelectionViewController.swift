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
        dogTableViewController = DogSelectionTableViewController()
        dogTableViewController.user = user
        
        tableView.register(
                    DogSelectionTableViewCell.nib,
                    forCellReuseIdentifier: DogSelectionTableViewCell.identifier
        )
        tableView.register(
                    LockedDogTableViewCell.nib,
                    forCellReuseIdentifier: LockedDogTableViewCell.identifier
        )
        
        tableView.dataSource = dogTableViewController
        // Do any additional setup after loading the view.
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
