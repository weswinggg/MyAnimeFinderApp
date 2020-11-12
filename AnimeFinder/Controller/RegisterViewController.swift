//
//  RegisterViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 10/31/20.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        navigationController?.navigationBar.barTintColor = kBrandBlue
        navigationController?.navigationBar.tintColor = kBrandWhite
        
        let registerView = RegisterView()
        view.addSubview(registerView)
        
        registerView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        registerView.delegate = self
    }
    
}

extension RegisterViewController: RegisterViewDelegate {
    func registerView(_ view: RegisterView, didTapRegisterButton: UIButton) {
        if let email = view.emailAddress, let password = view.password {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
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
