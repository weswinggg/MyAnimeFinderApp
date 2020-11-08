//
//  ResultsViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/2/20.
//

import UIKit
import Poi

class ResultsViewController: UIViewController {
        
    var results = [AnimeSearch.Result]()
    var sampleCards = [UIView]()
    var images = [UIImage]()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (i, anime) in results.enumerated() {
      
            let imageView = UIImageView(image: images[i])
            imageView.contentMode = UIView.ContentMode.scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let title = UILabel()
            title.translatesAutoresizingMaskIntoConstraints = false
            title.text = anime.title
            title.textColor = .black
            
            let description = UILabel()
            description.translatesAutoresizingMaskIntoConstraints = false
            description.text = anime.synopsis
            description.textColor = .black
            description.numberOfLines = 4
                        
            sampleCards.append(UIView(frame: view.bounds))
            sampleCards[i].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            sampleCards[i].layer.cornerRadius = 20
            sampleCards[i].clipsToBounds = true
            
            sampleCards[i].addSubview(imageView)
            sampleCards[i].addSubview(title)
            sampleCards[i].addSubview(description)
            
            let constraints = [
                imageView.topAnchor.constraint(equalTo: sampleCards[i].topAnchor),
                imageView.widthAnchor.constraint(equalTo: sampleCards[i].widthAnchor),
                imageView.heightAnchor.constraint(equalTo: sampleCards[i].heightAnchor, multiplier: CGFloat(0.7)),
                
                title.heightAnchor.constraint(equalToConstant: CGFloat(50)),
                title.centerXAnchor.constraint(equalTo: sampleCards[i].centerXAnchor),
                title.bottomAnchor.constraint(equalTo: description.topAnchor, constant: CGFloat(-20)),
                
                description.widthAnchor.constraint(equalTo: sampleCards[i].widthAnchor),
                description.bottomAnchor.constraint(equalTo: sampleCards[i].bottomAnchor, constant: CGFloat(-20))
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
        
        let resultsView = ResultsView()
        let poiView = resultsView.poiView
        view.addSubview(resultsView)
        
        resultsView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        view.backgroundColor = kBrandBlue
        
        poiView.center = view.center
        poiView.dataSource = self
        poiView.delegate = self
    }
    
}

extension ResultsViewController: PoiViewDataSource {
    func numberOfCards(_ poi: PoiView) -> Int {
        return results.count
    }
    
    func poi(_ poi: PoiView, viewForCardAt index: Int) -> UIView {
        return sampleCards[index]
    }

    func poi(_ poi: PoiView, viewForCardOverlayFor direction: SwipeDirection) -> UIImageView? {
        switch direction {
        case .right:
            return nil
        case .left:
            return nil
        }
    }

}

extension ResultsViewController: PoiViewDelegate {
    func poi(_ poi: PoiView, didSwipeCardAt: Int, in direction: SwipeDirection) {
        counter += 1
    }
    
    func poi(_ poi: PoiView, runOutOfCardAt: Int, in direction: SwipeDirection) {
    }

}
