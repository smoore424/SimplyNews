//
//  SearchResultsViewControllerTests.swift
//  SimplyNewsTests
//
//  Created by Stacey Moore on 1/9/22.
//

@testable import SimplyNews
import XCTest

class SearchResultsViewControllerTests: XCTestCase {
    
    var sut: SearchResultsViewController!

    override func setUp() {
        super.setUp()
        sut = SearchResultsViewController()
        sut.loadViewIfNeeded()
    }
    
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func testInit_createsSearchViewController() {
        XCTAssertNotNil(sut)
    }
    
    
    func testSearchResultsIsNotNil() {
        XCTAssertNotNil(sut.searchResults)
    }
    
    
    func testHasSearchBar() {
        XCTAssertNotNil(sut.searchBar)
    }

    
    func testHasTableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    
    func testTableViewHasDataSource() {
        let datasource = sut
        
        XCTAssertTrue(sut.tableView.dataSource === datasource)
    }
    
    
    func testSearchBarShowsCancelButton() {
        XCTAssertTrue(sut.searchBar.showsCancelButton)
    }

}
