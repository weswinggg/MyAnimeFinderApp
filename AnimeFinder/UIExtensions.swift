//
//  UIExtensions.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/7/20.
//

import UIKit

//MARK: UIView Extension for constraints
extension UIView {
        
    func anchor(top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, padding: UIEdgeInsets = .zero, priority: Float = 1000) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            let topConstraint = topAnchor.constraint(equalTo: top, constant: padding.top)
            topConstraint.isActive = true
            topConstraint.priority = UILayoutPriority(priority)
        }
        
        if let bottom = bottom {
            let bottomConstraint = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
            bottomConstraint.isActive = true
            bottomConstraint.priority = UILayoutPriority(priority)
        }
        
        if let leading = leading {
            let leadingConstraint = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
            leadingConstraint.isActive = true
            leadingConstraint.priority = UILayoutPriority(priority)
        }
        
        if let trailing = trailing {
            let trailingConstraint = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
            trailingConstraint.isActive = true
            trailingConstraint.priority = UILayoutPriority(priority)

        }
        
        if let centerX = centerX {
            let centerXConstraint = centerXAnchor.constraint(equalTo: centerX)
            centerXConstraint.isActive = true
            centerXConstraint.priority = UILayoutPriority(priority)
        }
        
        if let centerY = centerY {
            let centerYConstraint = centerYAnchor.constraint(equalTo: centerY)
            centerYConstraint.isActive = true
            centerYConstraint.priority = UILayoutPriority(priority)
        }

    }
}
