//
//  SNEmptyStateViewTests.swift
//  SimplyNewsTests
//
//  Created by Stacey Moore on 1/9/22.
//

@testable import SimplyNews
import XCTest

class SNEmptyStateViewTests: XCTestCase {

    var sut: SNEmptyStateView!
    
    override func setUp() {
        super.setUp()
        sut = SNEmptyStateView()
        sut.inputViewController?.loadViewIfNeeded()
    }
    
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func testHasMessageLabel() {
        XCTAssertNotNil(sut.messageLabel)
    }
}
