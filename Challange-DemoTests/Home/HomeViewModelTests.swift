//
//  HomeViewModelTests.swift
//  Challange-DemoTests
//
//  Created by Burak Nurçiçek on 14.06.2023.
//

import XCTest
@testable import Networking
@testable import Challange_Demo

class HomeViewModelTests: XCTestCase {
    var sut: HomeViewModel!
    var mockViewController: MockHomeViewController!
    var mockRepository: MockHomeRepository!
    
    override func setUp() {
        super.setUp()
        mockViewController = MockHomeViewController()
        mockRepository = MockHomeRepository()
        sut = HomeViewModel(repository: mockRepository)
        sut.view = mockViewController
    }
    
    override func tearDown() {
        sut = nil
        mockViewController = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_fetchData_givenTeamsResponse_callStartLoading() {
        mockRepository.mockTeamResponse = givenTestTeamResponse()
        
        let expectation = expectation(description: "fetchData")
        mockViewController.startLoadingAction = { startLoadingCallCount in
            XCTAssertEqual(startLoadingCallCount, 1)
            expectation.fulfill()
        }
        
        sut.viewDidLoad()
        wait(for: [expectation], timeout: 0.3)
    }

    func test_viewDidLoad_fetchData_givenNetworkError_callStartLoading() {
        mockRepository.mockNetworkError = givenTestError()
        
        let expectation = expectation(description: "fetchData")
        mockViewController.startLoadingAction = { startLoadingCallCount in
            XCTAssertEqual(startLoadingCallCount, 1)
            expectation.fulfill()
        }
        
        sut.viewDidLoad()
        wait(for: [expectation], timeout: 0.3)
    }
    
    func test_viewDidLoad_fetchData_givenTeamsResponse_callStopLoading() {
        mockRepository.mockTeamResponse = givenTestTeamResponse()
        
        let expectation = expectation(description: "fetchData")
        mockViewController.stopLoadingAction = { stopLoadingCallCount in
            XCTAssertEqual(stopLoadingCallCount, 1)
            expectation.fulfill()
        }
        
        sut.viewDidLoad()
        wait(for: [expectation], timeout: 0.3)
    }

    func test_viewDidLoad_fetchData_givenNetworkError_callStopLoading() {
        mockRepository.mockNetworkError = givenTestError()
        
        let expectation = expectation(description: "fetchData")
        mockViewController.stopLoadingAction = { stopLoadingCallCount in
            XCTAssertEqual(stopLoadingCallCount, 1)
            expectation.fulfill()
        }
        
        sut.viewDidLoad()
        wait(for: [expectation], timeout: 0.3)
    }
    
    func test_viewDidLoad_fetchData_givenTeamsResponse_callDisplay() {
        mockRepository.mockTeamResponse = givenTestTeamResponse()
        
        let expectation = expectation(description: "fetchData")
        mockViewController.displayAction = { didCallDisplay in
            XCTAssertTrue(didCallDisplay)
            expectation.fulfill()
        }
        
        sut.viewDidLoad()
        wait(for: [expectation], timeout: 0.3)
    }

    func test_viewDidLoad_fetchData_givenNetworkError_callDisplay() {
        mockRepository.mockNetworkError = givenTestError()
        
        let expectation = expectation(description: "fetchData")
        mockViewController.resultAction = { _ in
            expectation.fulfill()
        }
        
        sut.viewDidLoad()

        wait(for: [expectation], timeout: 0.3)
        XCTAssertFalse(mockViewController.didCallDisplay)
    }

    func test_viewDidLoad_fetchData_givenTeamsResponse_callShowResult() {
        mockRepository.mockTeamResponse = givenTestTeamResponse()
        
        let expectation = expectation(description: "fetchData")
        mockViewController.displayAction = { _ in
            expectation.fulfill()
        }
        
        sut.viewDidLoad()
        wait(for: [expectation], timeout: 0.3)
        XCTAssertFalse(mockViewController.didCallResult)
    }
    
    func test_viewDidLoad_fetchData_givenError_callShowResult() {
        mockRepository.mockNetworkError = givenTestError()
        let expectation = expectation(description: "fetchData")
        mockViewController.resultAction = { didCallResult in
            XCTAssertTrue(didCallResult)
            expectation.fulfill()
        }
        
        sut.viewDidLoad()
        wait(for: [expectation], timeout: 0.3)
    }
}

extension HomeViewModelTests {
    private func givenTestTeamResponse() -> TeamsResponse {
        let team = Team(teamName: "RedBull")
        return TeamsResponse(teams: [team])
    }

    private func givenTestError() -> NetworkError {
        .decodingError
    }
}
