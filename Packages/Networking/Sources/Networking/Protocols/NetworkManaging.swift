//
//  File.swift
//  
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation

// MARK: - NetworkManaging
public protocol NetworkManaging {
    func sendRequest<T: Decodable>(requestModel: NetworkRequest, responseModel: T.Type) async -> Result<T, NetworkError>
}
