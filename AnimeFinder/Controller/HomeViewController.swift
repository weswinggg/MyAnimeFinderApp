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
        
        let logoutBarButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutPressed))
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = logoutBarButton

        navigationController?.navigationBar.backgroundColor = kBrandBlue
        navigationController?.navigationBar.tintColor = kBrandWhite
        
        view.addSubview(homeView)
        
        homeView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        homeView.delegate = self
        animeManager.delegate = self
    }
    
    @objc func logoutPressed() {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
}

//MARK: MyAnimeManagerDelegate extension
extension HomeViewController: MyAnimeManagerDelegate {
    func didSearchComplete(with data: AnimeSearch) {
        searchResults = data.results
        
        images = [UIImage]()
        
        for i in searchResults {
            let image = animeManager.getImage(with: i.image_url)
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

//MARK: HomeViewDelegate extension
extension HomeViewController: HomeViewDelegate {
    func homeView(_ view: HomeView, didTapSearchButton: UIButton) {
        
        if let searchText = view.searchText, view.searchText != "" {
            animeManager.searchTitle(with: searchText)
            didTapSearchButton.toggleMyButtonEnabled()
        }
    }
}
