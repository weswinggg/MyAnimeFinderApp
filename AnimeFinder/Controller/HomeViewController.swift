//
//  HomeViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/1/20.
//

import UIKit
import Poi
import FirebaseAuth

class HomeViewController: UIViewController {
            
    var animeManager = MyAnimeManager()
    
    var images = [UIImage]()
    var genreFilter = [String]()
    
    private let homeView = HomeView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        let logoutBarButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutPressed))
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = logoutBarButton
        navigationController?.navigationBar.backgroundColor = kBrandBlue
        navigationController?.navigationBar.tintColor = kBrandWhite
        
        view.addSubview(homeView)
        homeView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        homeView.searchButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
    }
    
    @objc func logoutPressed() {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func searchPressed(_ sender: UIButton) {
        if let searchText = homeView.searchText, homeView.searchText != "" {
            animeManager.searchTitle(with: searchText) { data in
                self.images = [UIImage]()
                
                for i in data {
                    let image = self.animeManager.getImage(with: i.imageURL)
                    self.images.append(image)
                }
                
                DispatchQueue.main.async { [self] in
                    let resultsVC = ResultsViewController()
                    resultsVC.results = data
                    resultsVC.images = images
                    
                    homeView.searchButton.toggleMyButtonEnabled()
                    navigationController?.pushViewController(resultsVC, animated: true)
                }
            }
            
            sender.toggleMyButtonEnabled()
        }
    }
}
