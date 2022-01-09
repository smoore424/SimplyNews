//
//  SNDataViewControllerTests.swift
//  SimplyNewsTests
//
//  Created by Stacey Moore on 1/9/22.
//

@testable import SimplyNews
import XCTest

class SNDataViewControllerTests: XCTestCase {

    let expectedMessage = "Testing message"
    let view = UIView()
    
    var sut: SNDataViewController!
    
    override func setUp() {
        super.setUp()
        sut = SNDataViewController()
        sut.loadViewIfNeeded()
    }
    
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func test_init() {
        XCTAssertNotNil(sut)
    }

}
