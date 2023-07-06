//
//  EncodableExtensionTests.swift
//  
//
//  Created by Burak Nurçiçek on 21.06.2023.
//

import XCTest
@testable import Networking

// MARK: - EncodableExtensionTests
final class EncodableExtensionTests: XCTestCase {
   
    struct Car: Encodable {
        let brand: String
        let modelYear: Int?
    }

    func test_toDictionary_givenCar_setBrand() {
        let redBullRacing = "RedBull Racing"
        let car = Car(brand: redBullRacing, modelYear: nil)
        do {
            let carDict = try car.toDictionary()
            XCTAssertEqual(carDict["brand"] as? String, redBullRacing)
        } catch {
            XCTFail("Unexpected Error")
        }
    }

    func test_toDictionary_givenCar_setModelYear() {
        let modelYear = 2023
        let car = Car(brand: "RedBull Racing", modelYear: modelYear)
        do {
            let carDict = try car.toDictionary()
            XCTAssertEqual(carDict["modelYear"] as? Int, modelYear)
        } catch {
            XCTFail("Unexpected Error")
        }
    }
}
