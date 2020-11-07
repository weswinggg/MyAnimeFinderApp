//
//  RegisterView.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

class RegisterView: UIView {
    
    var delegate: RegisterViewDelegate?
    
    var emailAddress: String? {
        return emailField.text
    }
    
    var password: String? {
        return passwordField.text
    }
    
    private let welcomeTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Create Account.", attributes: [NSAttributedString.Key.font : UIFont(name: kFontBold, size: 40) ?? UIFont.systemFont(ofSize: 40)])
        
        attributedText.append(NSMutableAttributedString(string: "\n\nLet’s set your new account and start finding.", attributes: [NSAttributedString.Key.font : UIFont(name: kFontRegular, size: 25) ?? UIFont.systemFont(ofSize: 25)]))
        
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
        textField.setForm()
        textField.frame = CGRect(x: 0, y: 0, width: 330, height: 40)
        textField.setUnderLine()
        return textField
    }()
    
    private let passwordField: MyTextField = {
        let textField = MyTextField()
        textField.placeholder = "Password"
        textField.setForm(secure: true)
        textField.frame = CGRect(x: 0, y: 0, width: 330, height: 40)
        textField.setUnderLine()
        return textField
    }()
    
    private let registerButton: MyButton = {
        let button = MyButton()
        button.setSecondary(title: "Register", size: 25)
        button.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
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
        backgroundColor = .white
        
        let margins = layoutMarginsGuide
                    
        let formView = UIView()
        formView.backgroundColor = kBrandBlue
        formView.layer.cornerRadius = 43
        
        addSubview(formView)
        
        formView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        formView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        formView.addSubview(passwordField)
        
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordField.anchor(bottom: formView.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 100, right: 0))
        
        formView.addSubview(emailField)
        
        emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailField.anchor(bottom: passwordField.topAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 0))
        
        formView.addSubview(welcomeTextView)
        
        welcomeTextView.anchor(bottom: emailField.topAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 50, right: 0))
        welcomeTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
                                
        addSubview(registerButton)
        
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        registerButton.widthAnchor.constraint(lessThanOrEqualToConstant: 330).isActive = true
        // Set priority to 999 to use width constraint first
        registerButton.anchor(bottom: margins.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, centerX: centerXAnchor, padding: .init(top: 0, left: 20, bottom: 50, right: 20), priority: 999)
    }
    
    @objc func registerPressed(sender: UIButton) {
        delegate?.registerView(self, didTapRegisterButton: sender)
    }
    
}

protocol RegisterViewDelegate {
    func registerView(_ view: RegisterView, didTapRegisterButton: UIButton)
}
