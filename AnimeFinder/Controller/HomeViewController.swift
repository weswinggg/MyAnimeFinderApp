//
//  HomeViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/1/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    let animeManager = MyAnimeManager()
    
    @IBAction func testPressed(_ sender: UIButton) {
        
        animeManager.getList(with: "one")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animeManager.delegate = self
    }
}

extension HomeViewController: MyAnimeManagerDelegate {
    func didSearchComplete(with data: AnimeSearch) {
        for i in data.results {
            print(i.mal_id)
            print(i.title)
        }
    }
}
