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
    
    var searchResults = [AnimeSearch.Result]()
    var images = [UIImage]()
    var genreFilter = [String]()
    
    private let homeView = HomeView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        animeManager.delegate = self
        
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
            animeManager.searchTitle(with: searchText)
            sender.toggleMyButtonEnabled()
        }
    }
}

//MARK: MyAnimeManagerDelegate extension
extension HomeViewController: MyAnimeManagerDelegate {
    func didSearchComplete(with data: AnimeSearch) {
        searchResults = data.results
        
        images = [UIImage]()
        
        for i in searchResults {
            let image = animeManager.getImage(with: i.imageURL)
            images.append(image)
        }
        
        DispatchQueue.main.async { [self] in
            let resultsVC = ResultsViewController()
            resultsVC.results = searchResults
            resultsVC.images = images
            
            homeView.searchButton.toggleMyButtonEnabled()
            navigationController?.pushViewController(resultsVC, animated: true)
        }
    }
}
