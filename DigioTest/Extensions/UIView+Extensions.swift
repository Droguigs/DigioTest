//
//  UIView+Extensions.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

import UIKit

extension UIView {
    func setCornerRadius(radius newValue: CGFloat) {
          layer.cornerRadius = newValue
          layer.masksToBounds = (newValue > 0)
    }
    
    func setShadowRadius(radius newValue: CGFloat) {
        layer.shadowRadius = newValue
    }
    
    func setShadowOpacity(opacity newValue: CGFloat) {
        layer.shadowOpacity = Float(newValue)
    }
    
    func setShadowOffset(offset newValue: CGSize) {
        layer.shadowOffset = newValue
    }
    
    func setShadowColor(color newValue: UIColor?) {
        layer.shadowColor = newValue?.cgColor
    }
}
