//
//  SNTimeStampLabelTests.swift
//  SimplyNewsTests
//
//  Created by Stacey Moore on 1/9/22.
//

@testable import SimplyNews
import XCTest

class SNTimeStampLabelTests: XCTestCase {

    var sut: SNTimestampLabel!
    
    override func setUp() {
        super.setUp()
        sut = SNTimestampLabel()
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
