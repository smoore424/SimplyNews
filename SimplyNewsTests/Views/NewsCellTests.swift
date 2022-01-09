//
//  NewsCellTests.swift
//  SimplyNewsTests
//
//  Created by Stacey Moore on 1/9/22.
//

@testable import SimplyNews
import XCTest

class NewsCellTests: XCTestCase {

    var sut: NewsCell!
    
    override func setUp() {
        super.setUp()
        sut = NewsCell()
        sut.inputViewController?.loadViewIfNeeded()
        
        let newsItem = Article(source: Source(name: "testing source"), author: "testing author", title: "testing title", description: "testing description", url: "https://www.apple.com", urlToImage: "https://placekitten.com/640/360", publishedAt: "2022-01-09T21:13:13Z", content: "testing content")
        
        sut.set(newsItem: newsItem, withImage: true)
    }
    
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func testHasImageView() {
        XCTAssertNotNil(sut.newsImageView)
    }
    
    
    func testHasHeadlineLabel() {
        XCTAssertNotNil(sut.headlineLabel)
    }
    
    
    func testHasTimeStampLabel() {
        XCTAssertNotNil(sut.timestampLabel)
    }
    
    func testNewsCellSetsNewsItemHeadlineLabelTextCorrectly() {
        XCTAssertEqual(sut.headlineLabel.text, "testing title")
    }
    
//  TODO: time stamp label is equal to an amount of time in the past.
//    func testNewsCellSetsNewsItemTimeStampLabelCorrectly() {
//        XCTAssertEqual(sut.timestampLabel.text, "")
//    }
}
