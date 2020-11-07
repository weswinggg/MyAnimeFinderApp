//
//  HomeView.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

class HomeView: UIView {
    
    var delegate: HomeViewDelegate?
    
    var searchText: String {
        return searchTextField.text ?? ""
    }
    
    private let searchTextField: MyTextField = {
        let textField = MyTextField()
        textField.placeholder = "Search with title..."
        textField.backgroundColor = kBrandBlue
        return textField
    }()
    
    private let searchButton: MyButton = {
        let button = MyButton()
        button.setSecondary(title: "Search", size: 25)
        button.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        return button
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func layoutView() {
        backgroundColor = kBrandWhite
        
        let margins = layoutMarginsGuide
                
        let searchView = UIView()
        searchView.backgroundColor = kBrandBlue
        searchView.layer.cornerRadius = 43
        
        addSubview(searchView)
        
        searchView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        searchView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
        let searchTextFieldView = UIView()
        searchTextFieldView.layer.cornerRadius = 30
        searchTextFieldView.layer.borderColor = kBrandWhite?.cgColor
        searchTextFieldView.layer.borderWidth = 2
        
        searchView.addSubview(searchTextFieldView)
        
        searchTextFieldView.anchor(top: margins.topAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), priority: 999)
        searchTextFieldView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        searchTextFieldView.addSubview(searchTextField)
        
        searchTextField.anchor(top: searchTextFieldView.topAnchor, bottom: searchTextFieldView.bottomAnchor, leading: searchTextFieldView.leadingAnchor, trailing: searchTextFieldView.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        addSubview(searchButton)
        
        searchButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        searchButton.widthAnchor.constraint(lessThanOrEqualToConstant: 330).isActive = true
        // Set priority to 999 to use width constraint first
        searchButton.anchor(bottom: margins.bottomAnchor, leading: margins.leadingAnchor, trailing: margins.trailingAnchor, centerX: centerXAnchor, padding: .init(top: 0, left: 20, bottom: 50, right: 20), priority: 999)
    }
    
    @objc func searchPressed(sender: UIButton) {
        delegate?.homeView(self, didTapSearchButton: sender)
    }

}

protocol HomeViewDelegate {
    func homeView(_ view: HomeView, didTapSearchButton: UIButton)
}
