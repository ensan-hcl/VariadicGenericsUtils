//
//  VariadicGenericsUtilsTests.swift
//
//
//  Created by ensan on 2023/06/06.
//

@testable import VariadicGenericsUtils
import XCTest

final class VariadicGenericsUtilsTests: XCTestCase {
    func testConcat() throws {
        do {
            let result = concat(left: 1, true, 3, 4, right: 2, 3, 4, "5", 6)
            XCTAssertEqual(result.0, 1)
            XCTAssertEqual(result.1, true)
            XCTAssertEqual(result.2, 3)
            XCTAssertEqual(result.3, 4)
            XCTAssertEqual(result.4, 2)
            XCTAssertEqual(result.5, 3)
            XCTAssertEqual(result.6, 4)
            XCTAssertEqual(result.7, "5")
            XCTAssertEqual(result.8, 6)
        }
    }

    func testEqual() throws {
        do {
            let result = equal(left: 1, 2, 3, 4, right: 2, 3, 4, 5)
            XCTAssertFalse(result)
        }
        do {
            let result = equal(left: 1, "2", 3, false, right: 1, "2", 3, false)
            XCTAssertTrue(result)
        }
    }

    func testGreater() throws {
        do {
            let result = greater(left: 0, 4.1, 2.2, right: 1, 4.2, 5.2)
            XCTAssertTrue(result)
        }
        do {
            let result = greater(left: 1, right: 0)
            XCTAssertFalse(result)
        }
    }
}
