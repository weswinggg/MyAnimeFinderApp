//
//  MyButton.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

class MyButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func makeMyPrimary(title: String, size: CGFloat) {
        backgroundColor = kBrandWhite
        setTitleColor(kBrandBlue, for: .normal)
        addMyShadow()
        setMyValues(title, size)
    }
    
    func makeMySecondary(title: String, size: CGFloat) {
        
        backgroundColor = kBrandBlue
        setTitleColor(kBrandWhite, for: .normal)
        
        setMyValues(title, size)
    }
    
    private func setMyValues(_ title: String, _ size: CGFloat) {
        
        let fontRegular: String = kFontRegular
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: fontRegular, size: size)
        layer.cornerRadius = 9
    }

}
