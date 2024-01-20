// Copyright (c) 2018 NUS CS3217. All rights reserved.

import XCTest
@testable import GraphADT

class TreeTests: XCTestCase {

    func testConstruct() {
        let tree = Tree<String>(key: 2)

        XCTAssert(tree.isDirected)
        XCTAssertEqual(tree.key, 2)
    }

    func testAddTreeNode() {
        let tree = Tree<String>(key: 2)
        let node1 = Node<String>("one")
        let node2 = Node<String>("two")
        let node3 = Node<String>("three")
        let node4 = Node<String>("four")
        let node5 = Node<String>("five")
        let node6 = Node<String>("six")
        let node7 = Node<String>("seven")
        let node8 = Node<String>("eight")
        let node9 = Node<String>("nine")

        tree.addTreeNode(node: node1)
        tree.addTreeNode(node: node2)
        tree.addTreeNode(node: node3)
        tree.addTreeNode(node: node4)
        tree.addTreeNode(node: node5)
        tree.addTreeNode(node: node6)
        tree.addTreeNode(node: node7)
        tree.addTreeNode(node: node8)
        tree.addTreeNode(node: node9)

        XCTAssertEqual(tree.adjacentNodesFromNode(node1), [node2, node3])
        XCTAssertEqual(tree.adjacentNodesFromNode(node2), [node4, node5])
        XCTAssertEqual(tree.adjacentNodesFromNode(node3), [node6, node7])
        XCTAssertEqual(tree.adjacentNodesFromNode(node4), [node8, node9])
    }

    func testRemoveTreeNode() {
        let tree = Tree<String>(key: 2)
        let node1 = Node<String>("one")
        let node2 = Node<String>("two")
        let node3 = Node<String>("three")

        tree.addTreeNode(node: node1)
        tree.addTreeNode(node: node2)
        tree.addTreeNode(node: node3)
        tree.removeTreeNode(node: node3)

        XCTAssertEqual(tree.adjacentNodesFromNode(node1), [node2])
    }
}
