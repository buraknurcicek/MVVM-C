//
//  RequestBuilder.swift
//  
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

// MARK: - RequestBuilder
struct RequestBuilder {
    let request: NetworkRequest
}

// MARK: - RequestBuilding
extension RequestBuilder: RequestBuilding {
    func build() -> URLRequest {

        var url = request.baseURL
        if let path = request.path {
            url = url.appendingPathComponent(path)
        }

        var components = URLComponents(string: url.absoluteString)
        if let queryItems = request.queryItems,
           let dictionary = try? queryItems.toDictionary() {
            components?.queryItems = dictionary.compactMap { URLQueryItem(name: $0.key,
                                                                          value: $0.value as? String) }
        }

        var urlRequest = URLRequest(url: components?.url ?? url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        for header in request.headers {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }

        if let body = request.body,
           let dictionary = try? body.toDictionary(),
           let data = try? JSONSerialization.data(withJSONObject: dictionary,
                                                  options: .prettyPrinted) {
            urlRequest.httpBody = data
        }

        return urlRequest
    }
}
