//
//  WelcomeViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/6/20.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let welcomeView = WelcomeView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(welcomeView)
        
        welcomeView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        welcomeView.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        welcomeView.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: Button action functions
    @objc func loginPressed(_ sender: UIButton) {
        let loginVC = LoginAndRegisterViewController(for: .login)
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func registerPressed(_ sender: UIButton) {
        let registerVC = LoginAndRegisterViewController(for: .register)
        navigationController?.pushViewController(registerVC, animated: true)
    }
}
