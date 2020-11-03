//
//  ViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 10/31/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "WelcomeToLogin", sender: self)
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "WelcomeToRegister", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

}

