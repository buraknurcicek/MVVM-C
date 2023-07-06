//
//  HomeSectionTests.swift
//  Challange-DemoTests
//
//  Created by Burak Nurçiçek on 22.06.2023.
//

import XCTest
@testable import Challange_Demo

final class HomeSectionTests: XCTestCase {
    var sut: HomeSection!
    var didSelectHandler: IntHandler?
    
    override func setUp() {
        super.setUp()
        sut = HomeSection(models: [makeTestViewModel()], didSelectHandler: didSelectHandler)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_register_cells() {
        let tableView = UITableView()
        let section = HomeSection(models: [], didSelectHandler: nil)
        
        section.registerCells(for: tableView)
        XCTAssertTrue(tableView.dequeueReusableCell(withIdentifier: String(describing: HomeCell.self)) != nil)
    }
    
    func test_number_of_cell() {
        let models = [HomeCell.ViewModel(name: "Item 1"),
                      HomeCell.ViewModel(name: "Item 2"),
                      HomeCell.ViewModel(name: "Item 3")]
        let section = HomeSection(models: models, didSelectHandler: nil)
        
        let numberOfCells = section.numberOfCell()
        
        XCTAssertEqual(numberOfCells, models.count)
    }
    
    func test_deque_reusable_cell() {
        let tableView = UITableView()
        let models = [
            HomeCell.ViewModel(name: "Item 1"),
            HomeCell.ViewModel(name: "Item 2")
        ]
        let section = HomeSection(models: models, didSelectHandler: nil)
        
        tableView.register(HomeCell.self)
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = section.dequeReusableCell(in: tableView, at: indexPath)
        
        XCTAssertTrue(cell is HomeCell)
    }
    
    func test_item_did_select() {
        let tableView = UITableView()
        var selectedIndex: Int?
        let didSelectHandler: IntHandler = { index in
            selectedIndex = index
        }
        let section = HomeSection(models: [], didSelectHandler: didSelectHandler)
        
        let indexPath = IndexPath(row: 0, section: 0)
        section.itemDidSelect(in: tableView, at: indexPath.row)
        
        XCTAssertEqual(selectedIndex, indexPath.row)
    }
    
    func test_init_conformTableViewSectionProtocol() {
        XCTAssertNotNil(sut as TableViewSectionProtocol)
    }
    
    func test_numberOfCell_givenOneCell_setCell() {
        makeSUT(models: [makeTestViewModel()])
        XCTAssertEqual(sut.numberOfCell(), 1)
    }
    
    func test_numberOfCell_givenTwoCell_setCell() {
        makeSUT(models: [makeTestViewModel(), makeTestViewModel()])
        XCTAssertEqual(sut.numberOfCell(), 2)
    }
    
    func test_didSelect_givenTwoCell_setHandler() {
        makeSUT(models: [makeTestViewModel(), makeTestViewModel()])
        let tableView = UITableView()
        didSelectHandler = { index in
            XCTAssertEqual(index, 1)
        }
        
        sut.itemDidSelect(in: tableView, at: 1)
    }
}

extension HomeSectionTests {
    private func makeSUT(models: [HomeCell.ViewModel]) {
        sut = HomeSection(models: models, didSelectHandler: didSelectHandler)
    }
    
    private func makeTestViewModel() -> HomeCell.ViewModel {
        HomeCell.ViewModel(name: "Redbull")
    }
}
