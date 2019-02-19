//
//  MenuViewController.swift
//  RateMyAssignments
//
//  Created by Keith Ecker on 2/12/19.
//  Copyright © 2019 Keith Ecker. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MenuViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: set background and other things
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
}
