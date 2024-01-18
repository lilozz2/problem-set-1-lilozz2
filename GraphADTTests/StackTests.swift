//
//  StackTests.swift
//  GraphADTTests
//
//  Created by Jair Goh on 16/1/24.
//  Copyright © 2024 NUS CS3217. All rights reserved.
//

import XCTest
@testable import GraphADT

class StackTests: XCTestCase {

    func testToArray_item_inRightOrder() {
        var stack = Stack<Int>()
        stack.push(3)
        stack.push(2)
        stack.push(1)

        XCTAssertEqual(stack.toArray(), [1,2,3], "Stack should display with first element to be popped")
    }

    func testPop_item_inRightOrder() {
        var stack = Stack<Int>()
        stack.push(3)
        stack.push(2)
        stack.push(1)
        XCTAssertEqual(stack.pop(), 1, "Stack should pop in right order")
        stack.push(5)
        XCTAssertEqual(stack.pop(), 5, "Stack should pop in right order")
    }

    func testIsEmpty_withItem_returnsFalse() {
        var stack = Stack<Int>()
        stack.push(1)
        XCTAssertEqual(stack.isEmpty, false)
    }

    func testPop_noItemInStack_noError() {
        var stack = Stack<Int>()

        XCTAssertNoThrow(stack.pop())
    }


}
