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
    
    private func loadLayout() {
        font = UIFont(name: kFontRegular, size: 20)
        textColor = kBrandWhite
        tintColor = kBrandBlueGray
        backgroundColor = .none
        borderStyle = .none
        minimumFontSize = 15
        adjustsFontSizeToFitWidth = true
        autocorrectionType = .no
        autocapitalizationType = .none
    }
    
    func setMyUndeline() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: frame.height + 3, width: frame.width, height: 0.5)
        bottomLine.backgroundColor = kBrandWhite?.cgColor
        
        layer.addSublayer(bottomLine)
    }
}
