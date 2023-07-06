//
//  TestNetworkRequestGenerator.swift
//  
//
//  Created by Burak Nurçiçek on 21.06.2023.
//

import Foundation
@testable import Networking

// MARK: - TestNetworkRequestGenerator
enum TestNetworkRequestGenerator {
    static func generate(baseURL: URL = URL(string: "www.test.com")!,
                         path: String? = nil,
                         httpMethod: HTTPMethod = .get,
                         headers: [String: String] = ["testKey": "testValue"],
                         queryItems: Encodable? = nil,
                         body: Encodable? = nil) -> TestNetworkRequest {
        TestNetworkRequest(baseURL: baseURL,
                           path: path,
                           httpMethod: httpMethod,
                           headers: headers,
                           queryItems: queryItems,
                           body: body)
    }
}
