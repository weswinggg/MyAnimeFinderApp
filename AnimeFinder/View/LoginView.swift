//
//  LoginView.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

class LoginView: UIView {
    
    var emailAddress: String? {
        return emailField.text
    }
    
    var password: String? {
        return passwordField.text
    }
    
    private let welcomeTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Welcome back.", attributes: [NSAttributedString.Key.font : UIFont(name: kFontBold, size: 30) ?? UIFont.systemFont(ofSize: 30)])
        
        attributedText.append(NSMutableAttributedString(string: "\nLet’s get you something to watch.", attributes: [NSAttributedString.Key.font : UIFont(name: kFontRegular, size: 20) ?? UIFont.systemFont(ofSize: 20)]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .none
        textView.textColor = kBrandWhite
        return textView
    }()
    
    private let emailField: MyTextField = {
        let textField = MyTextField()
        textField.placeholder = "Email"
        textField.frame = CGRect(x: 0, y: 0, width: 330, height: 25)
        textField.setMyUndeline()
        return textField
    }()
    
    private let passwordField: MyTextField = {
        let textField = MyTextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.frame = CGRect(x: 0, y: 0, width: 330, height: 25)
        textField.setMyUndeline()
        return textField
    }()
    
    let loginButton: MyButton = {
        let button = MyButton()
        button.makeMySecondary(title: "Log in", size: 25)
        button.addMyShadow()
        button.setTitle("Logging in...", for: .disabled)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func layoutView() {
        backgroundColor = kBrandWhite
        
        let margins = layoutMarginsGuide
                    
        let formView = FormView()
        addSubview(formView)
        
        formView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        formView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        formView.addMyHeadingTextView(welcomeTextView)
        formView.addMyEmailPasswordFields(emailField: emailField, passwordField: passwordField)
                                
        addSubview(loginButton)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginButton.widthAnchor.constraint(lessThanOrEqualToConstant: 330).isActive = true
        // Set priority to 999 to use width constraint first
        loginButton.anchor(bottom: margins.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, centerX: centerXAnchor, padding: .init(top: 0, left: 20, bottom: 50, right: 20), priority: 999)
    }
}
