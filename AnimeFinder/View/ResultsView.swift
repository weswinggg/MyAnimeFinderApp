//
//  ResultsView.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/8/20.
//

import UIKit
import Poi

class ResultsView: UIView {

    let poiView = PoiView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func layoutView() {
        addSubview(poiView)
        poiView.frame = CGRect(x: 0, y: 0, width: 300, height: 600)

        poiView.layer.shadowColor = UIColor.black.cgColor
        poiView.layer.shadowRadius = 2
        poiView.layer.shadowOffset = .zero
        poiView.layer.shadowOpacity = 0.5
        
    }
}
