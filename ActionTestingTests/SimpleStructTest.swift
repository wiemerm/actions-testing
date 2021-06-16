//
//  SimpleStructTest.swift
//  ActionTestingTests
//
//  Created by Morgan Zellers on 6/16/21.
//
@testable import ActionTesting
import XCTest

class SimpleStructTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let testObject = SimpleStruct()
        XCTAssertEqual(testObject.foo, 1)
    }

}
