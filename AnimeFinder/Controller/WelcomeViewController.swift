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
        // Do any additional setup after loading the view.
        
        let welcomeView = WelcomeView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        welcomeView.center = view.center
        view.addSubview(welcomeView)
        
        welcomeView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
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

extension WelcomeViewController: WelcomeViewDelegate {
    func didTapLoginButton(_ sender: UIButton) {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func didTapRegisterButton(_ sender: UIButton) {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}
