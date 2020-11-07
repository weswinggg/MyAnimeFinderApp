//
//  HomeView.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

class HomeView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func layoutView() {
        backgroundColor = kBrandWhite
                
        let searchView = UIView()
        searchView.backgroundColor = kBrandBlue
        searchView.layer.cornerRadius = 43
        
        addSubview(searchView)
        
        searchView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        searchView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
    }

}
