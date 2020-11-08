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
            
    let animeManager = MyAnimeManager()
    
    var searchResults = [AnimeSearch.Result]()
    var images = [UIImage]()
    var genreFilter = [String]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoutBarButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutPressed))
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = logoutBarButton

        navigationController?.navigationBar.backgroundColor = kBrandBlue
        navigationController?.navigationBar.tintColor = kBrandWhite
        
        let homeView = HomeView()
        view.addSubview(homeView)
        
        homeView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        homeView.delegate = self
        
        animeManager.delegate = self
        /*
        let genres = animeManager.getGenres()
        print(genres)
        */
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

extension HomeViewController: MyAnimeManagerDelegate {
    func didSearchComplete(with data: AnimeSearch) {
        searchResults = data.results
        
        DispatchQueue.main.async { [self] in
            let resultsVC = ResultsViewController()
            resultsVC.results = searchResults
            images = [UIImage]()

            for i in searchResults {
                print(i.title)
                let image = animeManager.getImage(with: i.image_url)
                images.append(image)
            }
            
            resultsVC.images = images
            
            navigationController?.pushViewController(resultsVC, animated: true)
        }

    
    }
}

extension HomeViewController: HomeViewDelegate {
    func homeView(_ view: HomeView, didTapSearchButton: UIButton) {
        let searchText = view.searchText
        animeManager.searchTitle(with: searchText)
    }
}
