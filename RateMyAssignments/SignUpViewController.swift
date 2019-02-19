//
//  SignUpViewController.swift
//  RateMyAssignments
//
//  Created by Keith Ecker on 2/12/19.
//  Copyright © 2019 Keith Ecker. All rights reserved.
//

import Foundation
import UIKit
import Firebase
/*
 TODO:
 change button enabling based on text fields
 hide password text
 make prettier
 */
class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO:
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        handleSignUp()
    }
    
    @objc func handleSignUp(){
        
        guard let username = usernameTextField.text else {return}
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password){ user, error in
            if error == nil && user != nil{
                print("User created!")
                if let navController = self.navigationController {
                    navController.popViewController(animated: true)
                }
            }else{
                print("Error creating user: \(error!.localizedDescription)")
            }
        }
    }
}
