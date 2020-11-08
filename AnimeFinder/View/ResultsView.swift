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
        backgroundColor = kBrandBlue
        let width = frame.width * 0.7
        let height = frame.height * 0.7
        poiView.frame = CGRect(x: 0, y: 0, width: width, height: height)

        poiView.addMyShadow()
    }
}
