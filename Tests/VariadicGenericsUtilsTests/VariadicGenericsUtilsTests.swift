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

    func testLessThan() throws {
        do {
            let result = lessThan(left: 0, 4.1, 2.2, right: 1, 4.2, 5.2)
            XCTAssertTrue(result)
        }
        do {
            let result = lessThan(left: 0, 4.1, 2.2, right: 1, 5.2, 2.1)
            XCTAssertTrue(result)
        }
        do {
            let result = lessThan(left: 0, 4.1, 2.2, right: 0, 5.2, 2.1)
            XCTAssertTrue(result)
        }
        do {
            let result = lessThan(left: "A", 23, Date().advanced(by: 100), right: "A", 42, Date().advanced(by: 100))
            XCTAssertTrue(result)
        }
        do {
            let result = lessThan(left: 1, right: 0)
            XCTAssertFalse(result)
        }
    }

    func testSortedOn() throws {
        let users: [User] = [
            User(name: "A", age: 42, joinedDate: Date().advanced(by: 100)),
            User(name: "A", age: 42, joinedDate: Date().advanced(by: 200)),
            User(name: "A", age: 23, joinedDate: Date().advanced(by: 200)),
            User(name: "A", age: 23, joinedDate: Date().advanced(by: 100)),
            User(name: "B", age: 42, joinedDate: Date().advanced(by: 200)),
            User(name: "B", age: 23, joinedDate: Date().advanced(by: 200)),
        ]
        let result = users.sorted(on1: \.name, on2: \.age, on3: \.joinedDate)
        XCTAssertEqual(result, [
            users[3],
            users[2],
            users[0],
            users[1],
            users[5],
            users[4]
        ])
    }

    func testDebugOnlyPrint() {
        // debugOnlyPrint("Hi", 42, true, [12, 32])
    }
}

struct User: Equatable {
    var name: String
    var age: Int
    var joinedDate: Date
}

extension Sequence {
    func sorted(on1: (Element) -> some Comparable, on2: (Element) -> some Comparable, on3: (Element) -> some Comparable) -> [Element] {
        func compareByKeyPath(left: Element, right: Element) -> Bool {
            lessThan(
                left: on1(left), on2(left), on3(left),
                right: on1(right), on2(right), on3(right)
            )
        }
        return self.sorted(by: compareByKeyPath)
    }
}
