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
    @IBOutlet weak var formView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
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
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "BrandBlue")
        navigationController?.navigationBar.tintColor = UIColor(named: "BrandWhite")
        
        emailField.setUnderLine()
        passwordField.setUnderLine()
        
        formView.layer.cornerRadius = CGFloat(43)
        loginButton.layer.cornerRadius = CGFloat(9)
    }
    
}

extension UITextField {
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height + 3, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor(named: "BrandWhite")?.cgColor
        self.layer.addSublayer(bottomLine)
    }
}
