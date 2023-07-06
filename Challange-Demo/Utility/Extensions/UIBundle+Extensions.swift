//
//  UIBundle+Extensions.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 13.06.2023.
//

import Foundation

extension Bundle {
    static func infoPlistValue(forKey key: String) -> Any? {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) else {
           return nil
        }
        return value
    }
}
