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
    func didUpdateList(list: AnimeList) {
        for i in list.data {
            print(i.node.id)
            print(i.node.title)
        }
    }
}
