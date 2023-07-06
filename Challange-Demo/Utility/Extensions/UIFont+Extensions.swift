//
//  UIFont+Extension.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 13.06.2023.
//

import UIKit

extension UIFont {
    
    enum FormulaOneWeight: String {
        case regular = "FormulaOne-Regular"
        case bold = "FormulaOne-Bold"
    }
    
    class func formulaOneFont(_ weight: UIFont.FormulaOneWeight, size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: weight.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    class func regular(of size: CGFloat) -> UIFont {
        return formulaOneFont(.regular, size: size)
    }
    
    class func bold(of size: CGFloat) -> UIFont {
        return formulaOneFont(.bold, size: size)
    }
}
