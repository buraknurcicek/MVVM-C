//
//  Encodable+Extensions.swift
//  
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

// MARK: - Encodable+toDictionary
extension Encodable {

    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)

        guard let dictionary =
                try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }

        return dictionary
    }
}
