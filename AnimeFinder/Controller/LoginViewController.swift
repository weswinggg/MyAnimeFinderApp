//
//  LoginViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 10/31/20.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
              
                if let err = error {
                    print(err.localizedDescription)
                } else {
                    strongSelf.performSegue(withIdentifier: "LoginToHome", sender: self)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // code here after view loads
    }
    
}

