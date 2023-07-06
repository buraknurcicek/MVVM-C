//
//  NetworkRequest.swift
//  
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

// MARK: - NetworkRequest
public protocol NetworkRequest {
    var baseURL: URL { get }
    var path: String? { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: Encodable? { get }
    var body: Encodable? { get }
}
