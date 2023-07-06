//
//  NetworkError.swift
//  
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

// MARK: - NetworkError
public enum NetworkError: Error, LocalizedError {
    case noResponse
    case invalidStatusCode(statusCode: Int)
    case decodingError
    case unknown(error: Error)

    public var errorDescription: String? {
        switch self {
        case .noResponse:
            return "noResponse"
        case .invalidStatusCode(statusCode: let statusCode):
            return "invalidStatusCode: \(statusCode)"
        case .decodingError:
            return "decodingError"
        case .unknown(error: let error):
            return "unknown: \(error.localizedDescription)"
        }
    }
}
