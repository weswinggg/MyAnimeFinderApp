//
//  LoginViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 10/31/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        print("Login successful")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // code here after view loads
    }
    
}

