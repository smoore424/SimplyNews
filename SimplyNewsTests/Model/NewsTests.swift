//
//  NewsTests.swift
//  SimplyNewsTests
//
//  Created by Stacey Moore on 1/9/22.
//

@testable import SimplyNews
import XCTest

class NewsTests: XCTestCase {

    let expectedImage = UIImage(named: "dummy")
    let expectedHeadline = "Testing Headline"
    let expectedTimeStamp = "Testing TimeStamp"
    
    var sut: News!
    
    override func setUp() {
        super.setUp()
        sut = News(image: expectedImage!, headline: expectedHeadline, timeStamp: expectedTimeStamp)
    }
    
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func testNews_InitImage() {
        XCTAssertEqual(sut.image, expectedImage)
    }
    

    func testNews_InitHeadline() {
        XCTAssertEqual(sut.headline, expectedHeadline)
    }
    
    
    func testNews_InitTimeStamp() {
        XCTAssertEqual(sut.timeStamp, expectedTimeStamp)
    }
}
