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
        
        let attributedText = NSMutableAttributedString(string: "Welcome back.", attributes: [NSAttributedString.Key.font : UIFont(name: "Hiragino Sans W6", size: 40) ?? UIFont.systemFont(ofSize: 40)])
        
        attributedText.append(NSMutableAttributedString(string: "\n\nLet’s get you something to watch.", attributes: [NSAttributedString.Key.font : UIFont(name: "Hiragino Sans W3", size: 25) ?? UIFont.systemFont(ofSize: 25)]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .none
        textView.textColor = UIColor(named: "BrandWhite")
        return textView
    }()
    
    let emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont(name: "Hiragino Sans W3", size: 25)
        textField.textColor = UIColor(named: "BrandWhite")
        textField.tintColor = UIColor(named: "BrandBlueGray")
        textField.minimumFontSize = 15
        textField.borderStyle = .none
        textField.adjustsFontSizeToFitWidth = true
        
        textField.frame = CGRect(x: 0, y: 0, width: 330, height: 40)
        textField.setUnderLine()
        return textField
    }()
    
    let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont(name: "Hiragino Sans W3", size: 25)
        textField.textColor = UIColor(named: "BrandWhite")
        textField.tintColor = UIColor(named: "BrandBlueGray")
        textField.minimumFontSize = 15
        textField.borderStyle = .none
        textField.adjustsFontSizeToFitWidth = true
        textField.isSecureTextEntry = true
        
        textField.frame = CGRect(x: 0, y: 0, width: 330, height: 40)
        textField.setUnderLine()
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont(name: "Hiragino Sans W3", size: 25)
        button.setTitleColor(UIColor(named: "BrandWhite"), for: .normal)
        button.backgroundColor = UIColor(named: "BrandBlue")
        
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "BrandWhite")?.cgColor
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // code here after view loads
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "BrandBlue")
        navigationController?.navigationBar.tintColor = UIColor(named: "BrandWhite")
        
        setupLayout()
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        
        let margins = view.layoutMarginsGuide
                    
        let formView = UIView()
        formView.backgroundColor = UIColor(named: "BrandBlue")
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
        loginButton.anchor(bottom: margins.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 50, right: 20))
    }
    
    @objc func loginPressed(sender: UIButton) {
    }
    
}

//MARK: Set Underline for UITextField
extension UITextField {
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height + 3, width: self.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor(named: "BrandWhite")?.cgColor
        self.layer.addSublayer(bottomLine)
    }
}
