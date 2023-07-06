//
//  ColorHelper.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import UIKit

enum ColorName: String {
    case titleColor
    case descriptionColor
    case redColor
    case whiteColor
    case separatorColor
}

@dynamicMemberLookup
class ColorHelper {
    
    static let shared = ColorHelper()
    
    private init() { }
    
    subscript(dynamicMember dynamicMember: String) -> UIColor {
        if let color = UIColor(named: dynamicMember) {
            return color
        }
        
        return UIColor.cyan
    }
}
