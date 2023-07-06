//
//  Optional+Extensions.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

extension Optional where Wrapped == Int {
    var toIntValueOrZero: Int {
        return self ?? .zero
    }
}

extension Optional where Wrapped == Bool {
    var toBoolValueOrFalse: Bool {
        return self ?? false
    }
}

extension Optional where Wrapped == Double {
    var toDoubleValueOrZero: Double {
        return self ?? .zero
    }
}

extension Optional where Wrapped == String {
    var toStringValueOrEmpty: String {
        return self ?? ""
    }
    
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
