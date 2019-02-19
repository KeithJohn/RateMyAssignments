//
//  LoginViewController.swift
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
class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        handleSignIn()
        
    }
    
    @objc func handleSignIn(){
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error == nil && user != nil{
                print("User signed in!")
                if let navController = self.navigationController {
                    navController.popViewController(animated: true)
                }
            } else {
                    let alert = UIAlertController(title: "Error", message: "Your email or password is incorrect, please try again.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true)
                print("Error logging in: \(error!.localizedDescription)")
            }
        }
        
    }
}
