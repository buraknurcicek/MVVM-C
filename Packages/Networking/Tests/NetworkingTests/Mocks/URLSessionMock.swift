//
//  URLSessionMock.swift
//  
//
//  Created by Burak Nurçiçek on 21.06.2023.
//

import Foundation
@testable import Networking

class URLSessionMock {
    var dataResult: (Data, URLResponse)?
    var errorResult: Error?
}

extension URLSessionMock: URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let errorResult {
            throw errorResult
        }

        if let dataResult {
            return dataResult
        }

        throw NetworkError.noResponse
    }
}
