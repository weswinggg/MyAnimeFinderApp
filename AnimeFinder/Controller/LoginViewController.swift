//
//  LoginViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 10/31/20.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let welcomeTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Welcome back.", attributes: [NSAttributedString.Key.font : UIFont(name: kFontBold, size: 40) ?? UIFont.systemFont(ofSize: 40)])
        
        attributedText.append(NSMutableAttributedString(string: "\n\nLet’s get you something to watch.", attributes: [NSAttributedString.Key.font : UIFont(name: kFontRegular, size: 25) ?? UIFont.systemFont(ofSize: 25)]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .none
        textView.textColor = kBrandWhite
        return textView
    }()
    
    let emailField: MyTextField = {
        let textField = MyTextField()
        textField.placeholder = "Email"
        textField.setForm()
        textField.frame = CGRect(x: 0, y: 0, width: 330, height: 40)
        textField.setUnderLine()
        return textField
    }()
    
    let passwordField: MyTextField = {
        let textField = MyTextField()
        textField.placeholder = "Password"
        textField.setForm(secure: true)
        textField.frame = CGRect(x: 0, y: 0, width: 330, height: 40)
        textField.setUnderLine()
        return textField
    }()
    
    let loginButton: MyButton = {
        let button = MyButton()
        button.setSecondary(title: "Log in", size: 25)
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // code here after view loads
        
        navigationController?.navigationBar.barTintColor = kBrandBlue
        navigationController?.navigationBar.tintColor = kBrandWhite
        
        setupLayout()
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        
        let margins = view.layoutMarginsGuide
                    
        let formView = UIView()
        formView.backgroundColor = kBrandBlue
        formView.layer.cornerRadius = 43
        
        view.addSubview(formView)
        
        formView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        formView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        
        formView.addSubview(passwordField)
        
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordField.anchor(bottom: formView.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 100, right: 0))
        
        formView.addSubview(emailField)
        
        emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailField.anchor(bottom: passwordField.topAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 0))
        
        formView.addSubview(welcomeTextView)
        
        welcomeTextView.anchor(bottom: emailField.topAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 50, right: 0))
        welcomeTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
                                
        view.addSubview(loginButton)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginButton.widthAnchor.constraint(lessThanOrEqualToConstant: 330).isActive = true
        // Set priority to 999 to use width constraint first
        loginButton.anchor(bottom: margins.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, centerX: view.centerXAnchor, padding: .init(top: 0, left: 20, bottom: 50, right: 20), priority: 999)
    }
    
    @objc func loginPressed(sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let err = error {
                    print(err.localizedDescription)
                } else {
                    let homeVC = HomeViewController()
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
            }
        }
    }
    
}

