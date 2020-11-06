//
//  WelcomeViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/6/20.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont(name: "Hiragino Sans W3", size: 25)
        button.setTitleColor(UIColor(named: "BrandBlue"), for: .normal)
        button.backgroundColor = UIColor(named: "BrandWhite")

        button.layer.cornerRadius = 9
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return button
    }()

    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont(name: "Hiragino Sans W3", size: 25)
        button.setTitleColor(UIColor(named: "BrandWhite"), for: .normal)
        button.backgroundColor = UIColor(named: "BrandBlue")
        
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "BrandWhite")?.cgColor
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
        view.backgroundColor = UIColor(named: "BrandBlue")
        
        let margins = view.layoutMarginsGuide
                        
        let topHalfView = UIView()
        topHalfView.backgroundColor = .none
        
        view.addSubview(topHalfView)
        
        topHalfView.anchor(top: view.topAnchor, bottom: view.centerYAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        let title = UILabel()
        title.text = "My Anime Finder"
        title.font = UIFont(name: "Hiragino Sans W6", size: 35)
        title.textColor = UIColor(named: "BrandWhite")
        
        topHalfView.addSubview(title)
        
        title.anchor(centerX: topHalfView.centerXAnchor, centerY: topHalfView.centerYAnchor)
        
        view.addSubview(registerButton)
        
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        registerButton.anchor(bottom: margins.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 50, right: 20))
        
        view.addSubview(loginButton)

        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginButton.anchor(bottom: registerButton.topAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: UIEdgeInsets.init(top: 0, left: 20, bottom: 20, right: 20))
        
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

//MARK: UIView Extension for constraints
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true

        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }

    }
}
