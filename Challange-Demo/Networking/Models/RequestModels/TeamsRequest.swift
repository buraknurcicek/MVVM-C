//
//  TeamsRequest.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Networking

struct TeamsRequest: FormulaOneRequest {
    
    var path: String? {
        return "/teams"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
}
