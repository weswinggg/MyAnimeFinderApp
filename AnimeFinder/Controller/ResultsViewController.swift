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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (i, anime) in results.enumerated() {
      
            let imageView = UIImageView(image: images[i])
            imageView.contentMode = UIView.ContentMode.scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let textView = UITextView()
            
            let attributedText = NSMutableAttributedString(string: anime.title, attributes: [NSAttributedString.Key.font : UIFont(name: kFontBold, size: 25) ?? UIFont.systemFont(ofSize: 25)])
            
            attributedText.append(NSMutableAttributedString(string: "\n\(anime.synopsis)", attributes: [NSAttributedString.Key.font : UIFont(name: kFontRegular, size: 15) ?? UIFont.systemFont(ofSize: 15)]))
            
            textView.attributedText = attributedText
            textView.textAlignment = .left
            textView.isEditable = false
            textView.isScrollEnabled = false
            textView.backgroundColor = .none
            textView.textColor = kBrandBlue
            
            sampleCards.append(UIView(frame: view.bounds))
            sampleCards[i].backgroundColor = kBrandWhite
            sampleCards[i].layer.cornerRadius = 20
            sampleCards[i].clipsToBounds = true
            
            sampleCards[i].addSubview(imageView)
            
            imageView.anchor(top: sampleCards[i].topAnchor)
            imageView.widthAnchor.constraint(equalTo: sampleCards[i].widthAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: sampleCards[i].heightAnchor, multiplier: 0.7).isActive = true
            
            sampleCards[i].addSubview(textView)
            
            textView.anchor(bottom: sampleCards[i].bottomAnchor, leading: sampleCards[i].leadingAnchor, trailing: sampleCards[i].trailingAnchor, padding: .init(top: 0, left: 5, bottom: 5, right: 5))
            textView.heightAnchor.constraint(lessThanOrEqualTo: sampleCards[i].heightAnchor, multiplier: 0.25).isActive = true
        }
        
        let resultsView = ResultsView(frame: view.bounds)
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
            let thumbsup = UIImage(systemName: "hand.thumbsup")
            thumbsup?.withTintColor(.green)
            let imageView = UIImageView(image: thumbsup)
            imageView.frame = CGRect(x: 0, y: 0, width: poi.frame.width, height: poi.frame.width)
            imageView.tintColor = .green
            return imageView
        case .left:
            let thumbsdown = UIImage(systemName: "hand.thumbsdown")
            let imageView = UIImageView(image: thumbsdown)
            imageView.frame = CGRect(x: 0, y: 0, width: poi.frame.width, height: poi.frame.width)
            imageView.tintColor = .red
            return imageView
        }
    }

}

extension ResultsViewController: PoiViewDelegate {
    func poi(_ poi: PoiView, didSwipeCardAt: Int, in direction: SwipeDirection) {
    }
    
    func poi(_ poi: PoiView, runOutOfCardAt: Int, in direction: SwipeDirection) {
    }

}
