//
//  FormulaOneRequest.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation
import Networking

protocol FormulaOneRequest: NetworkRequest {}

extension FormulaOneRequest {
    
    var baseURL: URL {
        return NetworkConstants.baseURL!
    }
    
    var headers: [String: String] {
        guard let apiKey = Bundle.infoPlistValue(forKey: NetworkConstants.headerApiKey) as? String else { return [:] }
        return [NetworkConstants.headerApiKey: apiKey,
                NetworkConstants.headerHostKey: NetworkConstants.headerHostKeyValue]
    }
    
    var queryItems: Encodable? { nil }
    var body: Encodable? { nil }
}
