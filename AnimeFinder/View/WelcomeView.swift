//
//  WelcomeView.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

class WelcomeView: UIView {
    
    let loginButton: MyButton = {
       let button = MyButton()
        button.makeMyPrimary(title: "Log in", size: 25)
        return button
    }()

    let registerButton: MyButton = {
        let button = MyButton()
        button.makeMySecondary(title: "Register", size: 25)
        button.layer.borderWidth = 2
        button.layer.borderColor = kBrandWhite?.cgColor
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
        backgroundColor = kBrandBlue
        
        let margins = layoutMarginsGuide
                        
        let topHalfView = UIView()
        topHalfView.backgroundColor = .none
        
        addSubview(topHalfView)
        
        topHalfView.anchor(top: topAnchor, bottom: centerYAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        
        let title = UILabel()
        title.text = kAppTitle
        title.font = UIFont(name: kFontBold, size: 35)
        title.textColor = kBrandWhite
        
        topHalfView.addSubview(title)
        
        title.anchor(centerX: topHalfView.centerXAnchor, centerY: topHalfView.centerYAnchor)
        
        addSubview(registerButton)
        
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 330).isActive = true
        registerButton.anchor(bottom: margins.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, centerX: centerXAnchor, padding: .init(top: 0, left: 20, bottom: 50, right: 20), priority: 999)
        
        addSubview(loginButton)

        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 330).isActive = true
        loginButton.anchor(bottom: registerButton.topAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, centerX: centerXAnchor, padding: UIEdgeInsets.init(top: 0, left: 20, bottom: 20, right: 20), priority: 999)
        
    }
}
