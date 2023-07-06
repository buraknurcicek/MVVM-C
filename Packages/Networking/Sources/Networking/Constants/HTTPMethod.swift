//
//  HTTPMethod.swift
//  
//
//  Created by Burak Nurçiçek on 11.06.2023.
//

import Foundation

// MARK: - HTTPMethod
public enum HTTPMethod: String {
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
}
