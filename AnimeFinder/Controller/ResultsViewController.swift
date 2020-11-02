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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (i, res) in results.enumerated() {
            
            sampleCards.append(UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 240)))
            sampleCards[i].backgroundColor = UIColor(patternImage: images[i])
            
            print(res.title)
        }
        
        poiView.dataSource = self
        poiView.delegate = self
    }
}

extension ResultsViewController: PoiViewDataSource {
    func numberOfCards(_ poi: PoiView) -> Int {
        print(results.count)
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
    }
    
    func poi(_ poi: PoiView, runOutOfCardAt: Int, in direction: SwipeDirection) {
        print("last")
    }

}
