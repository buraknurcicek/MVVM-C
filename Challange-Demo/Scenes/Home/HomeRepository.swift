//
//  HomeRepository.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

import Foundation
import Networking

protocol HomeRepositoryProtocol {
    func getTeams() async -> (TeamsResponse?, NetworkError?)
}

final class HomeRepository: HomeRepositoryProtocol {
    
    private let manager: NetworkManager
    
    init(manager: NetworkManager = NetworkManager()) {
        self.manager = manager
    }
    
    func getTeams() async -> (TeamsResponse?, NetworkError?) {
        let request = TeamsRequest()
        let result = await manager.sendRequest(requestModel: request, responseModel: TeamsResponse.self)
        switch result {
        case .success(let teams):
            return (teams, nil)
        case .failure(let error):
            return (nil, error)
        }
    }
}
