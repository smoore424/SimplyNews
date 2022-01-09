//
//  SNHeadlineLabelTests.swift
//  SimplyNewsTests
//
//  Created by Stacey Moore on 1/9/22.
//

@testable import SimplyNews
import XCTest

class SNHeadlineLabelTests: XCTestCase {

    var sut: SNHeadlineLabel!
    
    override func setUp() {
        super.setUp()
        sut = SNHeadlineLabel()
        sut.inputViewController?.loadViewIfNeeded()
    }
    
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func test_init() {
        XCTAssertNotNil(sut)
    }
}
