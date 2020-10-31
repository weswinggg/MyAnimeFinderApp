//
//  RegisterViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 10/31/20.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        print("Register successfully")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // code here after view loads
    }
    
}
