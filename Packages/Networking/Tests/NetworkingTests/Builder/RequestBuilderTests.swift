//
//  RequestBuilderTests.swift
//  
//
//  Created by Burak Nurçiçek on 21.06.2023.
//

import XCTest
@testable import Networking

// MARK: - RequestBuilderTests
final class RequestBuilderTests: XCTestCase {
  
    var sut: RequestBuilder!

    // MARK: - Test Lifecycle
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - URL
    func test_build_givenDefaultRequest_setBaseURL() {
        makeSUT()
        let urlRequest = sut.build()
        XCTAssertTrue(urlRequest.url?.absoluteString.starts(with: "www.test.com") ?? false)
    }

    func test_build_givenCustomURL_setBaseURL() {
        let urlString = "www.formulaone.com"
        let url = URL(string: urlString)!
        makeSUT(baseURL: url)
        let urlRequest = sut.build()
        XCTAssertTrue(urlRequest.url?.absoluteString.starts(with: urlString) ?? false)
    }

    func test_build_givenCustomPath_setBaseURL() {
        let path = "/drivers"
        makeSUT(path: path)
        let urlRequest = sut.build()
        XCTAssertTrue(urlRequest.url?.absoluteString.hasSuffix(path) ?? false)
    }

    // MARK: - Query Items
    func test_build_givenEncodableObject_setQueryItems() {
        let redbull = TestRequestParameter(carName: "RB18", brand: nil)
        makeSUT(path: "/carDetail", queryItems: redbull)
        let urlRequest = sut.build()
        XCTAssertEqual(urlRequest.url?.absoluteString, "www.test.com/carDetail?carName=RB18")
    }

    // MARK: - HTTP Method
    func test_build_givenDefaultRequest_setHTTPMethod() {
        makeSUT()
        let urlRequest = sut.build()
        XCTAssertEqual(urlRequest.httpMethod, HTTPMethod.get.rawValue)
    }

    func test_build_givenPostRequest_setHTTPMethod() {
        makeSUT(httpMethod: .post)
        let urlRequest = sut.build()
        XCTAssertEqual(urlRequest.httpMethod, HTTPMethod.post.rawValue)
    }

    // MARK: - Body
    func test_build_givenBody_setHTTPBody() {
        let redbull = TestRequestParameter(carName: "RB18", brand: "RedBull")
        makeSUT(body: redbull)
        let urlRequest = sut.build()
        XCTAssertNotNil(urlRequest.httpBody)
        do {
            let car = try JSONDecoder().decode(TestRequestParameter.self, from: urlRequest.httpBody!)
            XCTAssertEqual(car.carName, redbull.carName)
        } catch {
            XCTFail("Unexpected Fail")
        }
    }
}

// MARK: - Helpers
extension RequestBuilderTests {
    func makeSUT(baseURL: URL = URL(string: "www.test.com")!,
                 path: String? = nil,
                 httpMethod: HTTPMethod = .get,
                 headers: [String: String] = ["testKey": "testValue"],
                 queryItems: Encodable? = nil,
                 body: Encodable? = nil) {
        let testRequest = TestNetworkRequestGenerator.generate(baseURL: baseURL,
                                                               path: path,
                                                               httpMethod: httpMethod,
                                                               headers: headers,
                                                               queryItems: queryItems,
                                                               body: body)
        sut = RequestBuilder(request: testRequest)
    }
}
