//
//  MainViewControllerTests.swift
//  SimplyNewsTests
//
//  Created by Stacey Moore on 1/5/22.
//

@testable import SimplyNews
import XCTest

//Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior

class MainViewControllerTests: XCTestCase {
    
    var sut: MainViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MainViewController()
        sut.loadViewIfNeeded()
    }
    
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    
    func testInit_createsMainViewController() {
        XCTAssertNotNil(sut)
    }

    
    func testHasTableViewContentView() {
        XCTAssertNotNil(sut.tableViewContentView)
    }
    
    
    func testHasTableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    
    func testTableViewHasDataSource() {
        let datasource = sut
        
        XCTAssertTrue(sut.tableView.dataSource === datasource)
    }
    
    
    func testHasCollectionViewContentView() {
        XCTAssertNotNil(sut.collectionViewContentView)
    }
    
    
    func testHasCollectionView() {
        XCTAssertNotNil(sut.collectionView)
    }
    
    
    func testCollectionViewHasDataSource() {
        let datasource = sut
        
        XCTAssertTrue(sut.collectionView.dataSource === datasource)
    }
    
    
    func testSelectedCategoryIsGeneral() {
        XCTAssertEqual(sut.selectedCategory, .general)
    }
    
    
    func testSelectedIndexPathIs00() {
        XCTAssertEqual(sut.selectedIndexPath, [0,0])
    }
    
    
    func testSafariViewControllerPresents() {
        //TODO:  Safari View Controller Presents
    }
}
