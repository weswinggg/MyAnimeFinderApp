//
//  MyButton.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

class MyButton: UIButton {
    
    func setPrimary(title: String, size: CGFloat) {
        backgroundColor = kBrandWhite
        setTitleColor(kBrandBlue, for: .normal)
        
        setMyValues(title, size)
    }
    
    func setSecondary(title: String, size: CGFloat) {
        
        backgroundColor = kBrandBlue
        setTitleColor(kBrandWhite, for: .normal)
        layer.borderWidth = 2
        layer.borderColor = kBrandWhite?.cgColor
        
        setMyValues(title, size)
    }
    
    private func setMyValues(_ title: String, _ size: CGFloat) {
        
        let fontRegular: String = "Hiragino Sans W3"
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: fontRegular, size: size)
        layer.cornerRadius = 9
        
    }

}
