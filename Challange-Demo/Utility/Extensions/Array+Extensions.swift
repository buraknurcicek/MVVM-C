//
//  Array$Extensions.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index < self.count else {
            return nil
        }
        
        return self[index]
    }
}
