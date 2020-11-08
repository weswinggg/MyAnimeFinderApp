//
//  FormView.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/8/20.
//

import UIKit

class FormView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func layoutView() {
                        
        backgroundColor = kBrandBlue
        layer.cornerRadius = 43
    }
    
    func addMyHeadingTextView(_ textView: UITextView) {
        addSubview(textView)
        
        let margins = layoutMarginsGuide
        textView.widthAnchor.constraint(equalToConstant: 330).isActive = true
        textView.anchor(top: margins.topAnchor, bottom: centerYAnchor, centerX: centerXAnchor, padding: .init(top: 20, left: 0, bottom: -20, right: 0))
    }
    
    func addMyEmailPasswordFields(emailField: UITextField, passwordField: UITextField) {
        
        addSubview(emailField)
        
        emailField.widthAnchor.constraint(equalToConstant: 330).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        emailField.anchor(top: centerYAnchor, centerX: centerXAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        addSubview(passwordField)

        passwordField.widthAnchor.constraint(equalToConstant: 330).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        passwordField.anchor(top: emailField.bottomAnchor, centerX: centerXAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0))
        
    }
}
