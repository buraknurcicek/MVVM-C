//
//  NetworkManagerTests.swift
//  
//
//  Created by Burak Nurçiçek on 21.06.2023.
//

import XCTest
@testable import Networking

// MARK: - NetworkManagerTests
final class NetworkManagerTests: XCTestCase {
 
    var sut: NetworkManager!
    var mockSession: URLSessionMock!

    // MARK: - Test Lifecycle
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        mockSession = nil
        sut = nil
        super.tearDown()
    }

    // MARK: - Unknown
    func test_sendRequest_givenUnknownError_setResult() async {
        let error = NSError(domain: "testDomain", code: 0)
        makeSUT(errorResult: error)
        let result = await sut.sendRequest(requestModel: TestNetworkRequestGenerator.generate(),
                                           responseModel: TestResponse.self)
        switch result {
        case .success:
            XCTFail("Unexpected Success")
        case .failure(let error):
            XCTAssertTrue(error.errorDescription?.starts(with: "unknown") ?? false)
        }
    }

    // MARK: - Empty Response
    func test_sendRequest_givenEmptyResponse_setResult() async {
        let urlResponse = URLResponse()
        makeSUT(dataResult: (makeData(), urlResponse))
        let result = await sut.sendRequest(requestModel: TestNetworkRequestGenerator.generate(),
                                           responseModel: TestResponse.self)
        switch result {
        case .success:
            XCTFail("Unexpected Success")
        case .failure(let error):
            XCTAssertEqual(error.errorDescription, "noResponse")
        }
    }

    // MARK: - Invalid JSON
    func test_sendRequest_givenInvalidJSON_setResult() async {
        let data = "{\"teamNamee\":\"Redbull\"}".data(using: .utf8)!
        let urlResponse = makeHTTPURLResponse()
        makeSUT(dataResult: (data, urlResponse))
        let result = await sut.sendRequest(requestModel: TestNetworkRequestGenerator.generate(),
                                           responseModel: TestResponse.self)
        switch result {
        case .success:
            XCTFail("Unexpected Success")
        case .failure(let error):
            XCTAssertEqual(error.errorDescription, "decodingError")
        }
    }

    // MARK: - Status Code
    func test_sendRequest_givenInvalidStatusCode_setResult() async {
        makeSUT(dataResult: (makeData(), makeHTTPURLResponse(statusCode: 500)))
        let result = await sut.sendRequest(requestModel: TestNetworkRequestGenerator.generate(),
                                           responseModel: TestResponse.self)
        switch result {
        case .success:
            XCTFail("Unexpected Success")
        case .failure(let error):
            XCTAssertEqual(error.errorDescription, "invalidStatusCode: 500")
        }
    }

    // MARK: - Valid JSON
    func test_sendRequest_givenValidJSON_setResult() async {
        let dataResult = (makeData(), makeHTTPURLResponse())
        makeSUT(dataResult: dataResult)
        let result = await sut.sendRequest(requestModel: TestNetworkRequestGenerator.generate(),
                                           responseModel: TestResponse.self)
        switch result {
        case .success(let response):
            XCTAssertEqual(response.teamName, "Redbull")
        case .failure:
            XCTFail("Unexpected Fail")
        }
    }
}

// MARK: - Helpers
extension NetworkManagerTests {
    func makeSUT(dataResult: (Data, URLResponse)? = nil,
                 errorResult: Error? = nil) {
        mockSession = URLSessionMock()
        mockSession.dataResult = dataResult
        mockSession.errorResult = errorResult
        sut = NetworkManager(session: mockSession)
    }

    func makeData(teamName: String = "Redbull") -> Data {
        "{\"teamName\":\"\(teamName)\"}".data(using: .utf8)!
    }

    func makeHTTPURLResponse(url: URL = URL(string: "www.test.com")!,
                             statusCode: Int = 200,
                             httpVersion: String? = nil,
                             headerFields: [String: String]? = nil) -> HTTPURLResponse {
        HTTPURLResponse(url: url,
                        statusCode: statusCode,
                        httpVersion: httpVersion,
                        headerFields: headerFields)!
    }
}
