//
//  LoginViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 10/31/20.
//

import UIKit
import FirebaseAuth

class LoginAndRegisterViewController: UIViewController {
    
    // Display either Login or Register View
    enum Display {
        case login
        case register
    }
    
    private let display: Display
    private var displayView = UIView()

    init(for display: Display) {
        self.display = display
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        // setup button function for Login or Register
        switch display {
        case .login:
            displayView = LoginView()
            (displayView as! LoginView).loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        case .register:
            displayView = RegisterView()
            (displayView as! RegisterView).registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        }
        
        navigationController?.navigationBar.barTintColor = kBrandBlue
        navigationController?.navigationBar.tintColor = kBrandWhite
        
        view.addSubview(displayView)
        
        displayView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
    }
    
    @objc func loginPressed(_ sender: UIButton) {
        let view = displayView as! LoginView
        if let email = view.emailAddress, let password = view.password {
            sender.toggleMyButtonEnabled()
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let homeVC = HomeViewController()
                    sender.toggleMyButtonEnabled()
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
            }
        }
    }
    
    @objc func registerPressed(_ sender: UIButton) {
        let view = displayView as! RegisterView
        if let email = view.emailAddress, let password = view.password {
            sender.toggleMyButtonEnabled()
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let homeVC = HomeViewController()
                    sender.toggleMyButtonEnabled()
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
            }
        }
    }
}
