//
//  ViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 10/31/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "WelcomeToLogin", sender: self)
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "WelcomeToRegister", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerButton.layer.borderWidth = CGFloat(2)
        registerButton.layer.borderColor = UIColor(named: "BrandWhite")?.cgColor
        registerButton.layer.cornerRadius = CGFloat(9)
        
        loginButton.layer.cornerRadius = CGFloat(9)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

}

