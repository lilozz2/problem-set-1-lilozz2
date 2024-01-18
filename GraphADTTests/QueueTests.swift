//
//  QueueTests.swift
//  GraphADTTests
//
//  Created by Jair Goh on 16/1/24.
//  Copyright © 2024 NUS CS3217. All rights reserved.
//

import XCTest
@testable import GraphADT

class QueueTests: XCTestCase {

    func testToArray_item_inRightOrder() {
        var queue = Queue<Int>()
        queue.enqueue(3)
        queue.enqueue(2)
        queue.enqueue(1)

        XCTAssertEqual(queue.toArray(), [3,2,1], "Queue should have first element to be popped in first index")
    }

    func testPop_item_inRightOrder() {
        var queue = Queue<Int>()
        queue.enqueue(3)
        queue.enqueue(2)
        queue.enqueue(1)
        XCTAssertEqual(queue.dequeue(), 3, "Queue should pop in right order")
        queue.enqueue(5)
        XCTAssertEqual(queue.dequeue(), 2, "Queue should pop in right order")
    }

    func testIsEmpty_withItem_returnsFalse() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        XCTAssertEqual(queue.isEmpty, false)
    }

    func testPop_noItemInQueue_noError() {
        var queue = Queue<Int>()

        XCTAssertNoThrow(queue.dequeue())
    }
}
