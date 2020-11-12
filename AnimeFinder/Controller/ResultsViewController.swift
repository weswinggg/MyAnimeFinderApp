//
//  ResultsViewController.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/2/20.
//

import UIKit
import Poi
import ReplayKit

class ResultsViewController: UIViewController {
    
    let recorder = RPScreenRecorder.shared()
    
    let recordButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Record", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(recordPressed), for: .touchUpInside)
        return button
    }()
    
    var results = [AnimeSearch.Result]()
    var sampleCards = [UIView]()
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (i, anime) in results.enumerated() {
      
            let imageView = UIImageView(image: images[i])
            imageView.contentMode = UIView.ContentMode.scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let textView = UITextView()
            
            let attributedText = NSMutableAttributedString(string: anime.title, attributes: [NSAttributedString.Key.font : UIFont(name: kFontBold, size: 20) ?? UIFont.systemFont(ofSize: 20)])
            
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
            
            imageView.anchor(top: sampleCards[i].topAnchor, leading: sampleCards[i].leadingAnchor, trailing: sampleCards[i].trailingAnchor)
            imageView.heightAnchor.constraint(equalTo: sampleCards[i].heightAnchor, multiplier: 0.7).isActive = true
            
            let bottomView = UIView()
            
            sampleCards[i].addSubview(bottomView)
            
            bottomView.anchor(bottom: sampleCards[i].bottomAnchor, leading: sampleCards[i].leadingAnchor, trailing: sampleCards[i].trailingAnchor)
            bottomView.heightAnchor.constraint(equalTo: sampleCards[i].heightAnchor, multiplier: 0.3).isActive = true
                        
            bottomView.addSubview(textView)
            
            textView.anchor(top: bottomView.topAnchor, leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 5))
        }
        
        let resultsView = ResultsView(frame: view.bounds)
        let poiView = resultsView.poiView
        view.addSubview(resultsView)
        
        resultsView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        view.backgroundColor = kBrandBlue
        
        poiView.center = view.center
        poiView.dataSource = self
        poiView.delegate = self
        
        view.addSubview(recordButton)
        
        recordButton.anchor(bottom: view.bottomAnchor, centerX: view.centerXAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 0))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        if recorder.isRecording {
            // stop recording if moved to different view
            recorder.stopRecording(handler: nil)
        }
    }
    
    // toggle recording
    @objc func recordPressed(sender: UIButton) {
        
        if recorder.isRecording {
            sender.setTitle("Record", for: .normal)
            recorder.stopRecording { (previewVC, error) in
                if let e = error {
                    print(e.localizedDescription)
                } else if let previewVC = previewVC {
                    
                    previewVC.previewControllerDelegate = self
                    // display the recorded video to save, edit...
                    self.present(previewVC, animated: true, completion: nil)
                }
            }
        } else {
            sender.setTitle("Stop", for: .normal)
            recorder.startRecording { (error) in
                if let e = error {
                    print(e.localizedDescription)
                }
            }
        }
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

//MARK: RPPreview protocol
extension ResultsViewController: RPPreviewViewControllerDelegate {
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        // remove the previewController
        dismiss(animated: true, completion: nil)
    }
}
