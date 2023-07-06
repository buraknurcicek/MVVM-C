//
//  File.swift
//  
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

// MARK: - NetworkManager
public struct NetworkManager {
 
    private let session: URLSessionProtocol

    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
}

// MARK: - NetworkManaging
extension NetworkManager: NetworkManaging {
    public func sendRequest<T: Decodable>(requestModel: NetworkRequest,
                                          responseModel: T.Type) async -> Result<T, NetworkError> {
        let requestBuilder = RequestBuilder(request: requestModel)
        let urlRequest = requestBuilder.build()
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }

            switch response.statusCode {
            case 200...299:
                guard let response = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decodingError)
                }

                return .success(response)
            default:
                return .failure(.invalidStatusCode(statusCode: response.statusCode))
            }
        } catch let error {
            return .failure(.unknown(error: error))
        }
    }
}
