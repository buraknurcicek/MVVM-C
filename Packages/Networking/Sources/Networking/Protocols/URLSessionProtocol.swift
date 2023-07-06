//
//  File.swift
//  
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

// MARK: - URLSessionProtocol
public protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

// MARK: - URLSession + URLSessionProtocol
extension URLSession: URLSessionProtocol { }
