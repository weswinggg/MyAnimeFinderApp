//
//  LoginViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 10/31/20.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // code here after view loads
        
        navigationController?.navigationBar.barTintColor = kBrandBlue
        navigationController?.navigationBar.tintColor = kBrandWhite
        
        let loginView = LoginView()
        
        view.addSubview(loginView)
        loginView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        
        loginView.delegate = self
    }
    
}

extension LoginViewController: LoginViewDelegate {
    func loginView(_ view: LoginView, didTapLoginButton: UIButton) {
        if let email = view.emailAddress, let password = view.password {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let homeVC = HomeViewController()
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
            }
        }
    }
}

