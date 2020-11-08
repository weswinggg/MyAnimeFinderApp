//
//  MyTextField.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

class MyTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadLayout() {
        font = UIFont(name: kFontRegular, size: 15)
        textColor = kBrandWhite
        tintColor = kBrandBlueGray
        backgroundColor = .none
        borderStyle = .none
        minimumFontSize = 10
        adjustsFontSizeToFitWidth = true
        autocorrectionType = .no
        autocapitalizationType = .none
        
    }
    
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: frame.height + 3, width: frame.width, height: 0.5)
        bottomLine.backgroundColor = kBrandWhite?.cgColor
        
        layer.addSublayer(bottomLine)
    }
}
