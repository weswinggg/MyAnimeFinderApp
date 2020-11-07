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
  
    /*
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var testButton: UIButton!
    
    @IBAction func testPressed(_ sender: UIButton) {
        let searchText = searchTextField.text ?? ""
        animeManager.searchTitle(with: searchText)
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.backgroundColor = kBrandBlue
        navigationController?.navigationBar.tintColor = kBrandWhite
        
        let logoutBarButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutPressed))
        
        navigationItem.leftBarButtonItem = logoutBarButton
        
        let homeView = HomeView()
        view.addSubview(homeView)
        
        homeView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        /*
        animeManager.delegate = self
        let genres = animeManager.getGenres()
        print(genres)
        */
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! ResultsViewController
        destination.results = searchResults
        images = [UIImage]()
        
        for i in searchResults {
            let image = animeManager.getImage(with: i.image_url)
            images.append(image)
        }
        
        destination.images = images
        
    }
    */
    
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

        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "SearchToResults", sender: self)
        }
    }
}
