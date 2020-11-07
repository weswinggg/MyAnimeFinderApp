//
//  MyTextField.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

class MyTextField: UITextField {

    func setForm(secure: Bool = false) {
        font = UIFont(name: kFontRegular, size: 25)
        textColor = kBrandWhite
        tintColor = kBrandBlueGray
        minimumFontSize = 15
        borderStyle = .none
        adjustsFontSizeToFitWidth = true
        autocorrectionType = .no
        autocapitalizationType = .none
        isSecureTextEntry = secure
    }

}
