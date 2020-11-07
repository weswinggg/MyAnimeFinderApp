//
//  WelcomeViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/6/20.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let loginButton: MyButton = {
       let button = MyButton()
        button.setPrimary(title: "Log in", size: 25)
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return button
    }()

    let registerButton: MyButton = {
        let button = MyButton()
        button.setSecondary(title: "Register", size: 25)
        button.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    func setupLayout() {
        view.backgroundColor = kBrandBlue
        
        let margins = view.layoutMarginsGuide
                        
        let topHalfView = UIView()
        topHalfView.backgroundColor = .none
        
        view.addSubview(topHalfView)
        
        topHalfView.anchor(top: view.topAnchor, bottom: view.centerYAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        let title = UILabel()
        title.text = kAppTitle
        title.font = UIFont(name: kFontBold, size: 35)
        title.textColor = kBrandWhite
        
        topHalfView.addSubview(title)
        
        title.anchor(centerX: topHalfView.centerXAnchor, centerY: topHalfView.centerYAnchor)
        
        view.addSubview(registerButton)
        
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 330).isActive = true
        registerButton.anchor(bottom: margins.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, centerX: view.centerXAnchor, padding: .init(top: 0, left: 20, bottom: 50, right: 20), priority: 999)
        
        view.addSubview(loginButton)

        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 330).isActive = true
        loginButton.anchor(bottom: registerButton.topAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, centerX: view.centerXAnchor, padding: UIEdgeInsets.init(top: 0, left: 20, bottom: 20, right: 20), priority: 999)
        
    }

    @objc func loginPressed(sender: UIButton) {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

    @objc func registerPressed(sender: UIButton) {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }

}

