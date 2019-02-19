//
//  HomeScreenViewController.swift
//  RateMyAssignments
//
//  Created by Keith Ecker on 2/13/19.
//  Copyright © 2019 Keith Ecker. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class HomeScreenViewController: UITableViewController{
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        try! Auth.auth().signOut()
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
}
