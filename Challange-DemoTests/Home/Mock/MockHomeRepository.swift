//
//  MockHomeRepository.swift
//  Challange-DemoTests
//
//  Created by Burak Nurçiçek on 14.06.2023.
//

import Foundation
@testable import Networking
@testable import Challange_Demo

class MockHomeRepository: HomeRepositoryProtocol {
    var mockTeamResponse: TeamsResponse?
    var mockNetworkError: NetworkError?

    func getTeams() async -> (TeamsResponse?, NetworkError?) {
        return (mockTeamResponse, mockNetworkError)
    }
}
