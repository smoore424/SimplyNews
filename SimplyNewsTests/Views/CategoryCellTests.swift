//
//  CategoryCellTests.swift
//  SimplyNewsTests
//
//  Created by Stacey Moore on 1/9/22.
//

@testable import SimplyNews
import XCTest

class CategoryCellTests: XCTestCase {
    
    var sut: CategoryCell!

    override func setUp() {
        super.setUp()
        sut = CategoryCell()
        sut.inputViewController?.loadView()
    }
    
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func testHasImageView() {
        XCTAssertNotNil(sut.imageView)
    }
    
    
    func testHasLabel() {
        XCTAssertNotNil(sut.label)
    }
    
    
    //MARK: Tests for Category titles
    func testSetCellsForIndex0CategoryIsGeneral() {
        let indexPath = 0
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.text, "General")
    }
    
    
    func testSetCellsForIndex1CategoryIsBusiness() {
        let indexPath = 1
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.text, "Business")
    }
    

    func testSetCellsForIndex2CategoryIsEntertainment() {
        let indexPath = 2
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.text, "Entertainment")
    }
    
    
    func testSetCellsForIndex3CategoryIsScience() {
        let indexPath = 3
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.text, "Science")
    }
    
    
    func testSetCellsForIndex4CategoryIsSports() {
        let indexPath = 4
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.text, "Sports")
    }
    
    
    func testSetCellsForIndex5CategoryIsTechnology() {
        let indexPath = 5
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.text, "Technology")
    }
    
    
    //MARK: Tests for Category Color
    func testSetCellsForIndex0UnselectedTextColorIsSystemTeal() {
        let indexPath = 0
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.textColor, .systemTeal)
    }
    
    
    func testSetCellsForIndex1UnselectedTextColorIsSystemBlue() {
        let indexPath = 1
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.textColor, .systemBlue)
    }
    
    
    func testSetCellsForIndex2UnselectedTextColorIsSystemPink() {
        let indexPath = 2
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.textColor, .systemPink)
    }
    
    
    func testSetCellsForIndex3UnselectedTextColorIsSystemGreen() {
        let indexPath = 3
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.textColor, .systemGreen)
    }
    
    
    func testSetCellsForIndex4UnselectedTextColorIsSystemOrange() {
        let indexPath = 4
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.textColor, .systemOrange)
    }
    
    
    func testSetCellsForIndex5UnselectedTextColorIsSystemBrown() {
        let indexPath = 5
        
        sut.setCells(for: indexPath, selected: false)
        
        XCTAssertEqual(sut.label.textColor, .systemBrown)
    }
    
    
    //MARK: CategoryID Tests
    func testGetCategoryIDForIndex0IsGeneral() {
        let indexPath = 0
        
        let catID = sut.getCategoryID(for: indexPath)
        
        XCTAssertEqual(catID, .general)
    }
    
    
    func testGetCategoryIDForIndex1IsBusiness() {
        let indexPath = 1
        
        let catID = sut.getCategoryID(for: indexPath)
        
        XCTAssertEqual(catID, .business)
    }
    
    
    func testGetCategoryIDForIndex2IsGeneral() {
        let indexPath = 2
        
        let catID = sut.getCategoryID(for: indexPath)
        
        XCTAssertEqual(catID, .entertainment)
    }
    
    
    func testGetCategoryIDForIndex3IsScience() {
        let indexPath = 3
        
        let catID = sut.getCategoryID(for: indexPath)
        
        XCTAssertEqual(catID, .science)
    }
    
    
    func testGetCategoryIDForIndex4IsSports() {
        let indexPath = 4
        
        let catID = sut.getCategoryID(for: indexPath)
        
        XCTAssertEqual(catID, .sports)
    }
    
    
    func testGetCategoryIDForIndex5IsGeneral() {
        let indexPath = 5
        
        let catID = sut.getCategoryID(for: indexPath)
        
        XCTAssertEqual(catID, .technology)
    }
}
