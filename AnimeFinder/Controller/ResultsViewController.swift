//
//  ResultsViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/2/20.
//

import UIKit
import Poi

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var poiView: PoiView!
    
    var results = [AnimeSearch.Result]()
    var sampleCards = [UIView]()
    var images = [UIImage]()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (i, _) in results.enumerated() {
      
            let imageView = UIImageView(image: images[i])
            imageView.contentMode = UIView.ContentMode.scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
                        
            sampleCards.append(UIView(frame: self.view.bounds))
            sampleCards[i].addSubview(imageView)
            sampleCards[i].backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            sampleCards[i].layer.cornerRadius = 20
            sampleCards[i].clipsToBounds = true
            
            let constraints = [
                imageView.topAnchor.constraint(equalTo: sampleCards[i].topAnchor),
                imageView.widthAnchor.constraint(equalTo: sampleCards[i].widthAnchor),
                imageView.heightAnchor.constraint(equalTo: sampleCards[i].heightAnchor, multiplier: CGFloat(0.7))
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
        
        poiView.dataSource = self
        poiView.delegate = self
    }
    
}

extension ResultsViewController: PoiViewDataSource {
    func numberOfCards(_ poi: PoiView) -> Int {
        return results.count
    }
    
    func poi(_ poi: PoiView, viewForCardAt index: Int) -> UIView {
        print("card idx:",index)
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
        print(didSwipeCardAt, direction)
        counter += 1
    }
    
    func poi(_ poi: PoiView, runOutOfCardAt: Int, in direction: SwipeDirection) {
        print("last")
    }

}
