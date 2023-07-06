//
//  TestNetworkRequest.swift
//  
//
//  Created by Burak Nurçiçek on 21.06.2023.
//

import Foundation
@testable import Networking

struct TestNetworkRequest: NetworkRequest {
    var baseURL: URL
    var path: String?
    var httpMethod: HTTPMethod
    var headers: [String: String]
    var queryItems: Encodable?
    var body: Encodable?
}
