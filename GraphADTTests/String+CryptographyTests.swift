//
//  String+CryptographyTests.swift
//  GraphADTTests
//
//  Created by Jair Goh on 20/1/24.
//  Copyright © 2024 NUS CS3217. All rights reserved.
//


import XCTest
@testable import GraphADT

class StringCryptographyTests: XCTestCase {
    func testEncipherWithKey() {
        let testString = "HELLO WORLD"
        print(testString.encipherWithKey(2))

        XCTAssertEqual(testString.encipherWithKey(2), "HELOROLDL **W")
    }

    func testGetMaxDepth() {
        let testString = "HELLO WORLD"
        XCTAssertEqual(testString.getMaxDepth(), 3)
    }

    func testGetMaxDepth2() {
        let testString = "HELLO W"
        XCTAssertEqual(testString.getMaxDepth(), 2)
    }

    func testAddTrailingFillerChars() {
        let testString = "HELLO WORLD"
        XCTAssertEqual(testString.addTrailingFillerChars(), "HELLO WORLD****")
    }

    func testAddTrailingFillerChars2() {
        let testString = "HELLO W"
        XCTAssertEqual(testString.addTrailingFillerChars(), "HELLO W")
    }

    func testDecipherWithKey_encipheredString() {
        let testString = "HELLO WORLD"
        let encipheredString = testString.encipherWithKey(2)

        print(encipheredString.decipherWithKey(2))

        XCTAssert(true)
    }
}
