// Copyright (c) 2018 NUS CS3217. All rights reserved.

import XCTest
@testable import GraphADT

class GraphTests: XCTestCase {

    func testConstruct() {
        let graph = Graph<String>(isDirected: true)

        XCTAssert(graph.isDirected)
    }

    func testContainsNode_addNode() {
        let graph = Graph<String>(isDirected: true)
        let node1 = Node<String>("one")
        graph.addNode(node1)

        XCTAssert(graph.containsNode(node1))
    }

    func testRemoveNode_listHasEdgesWithNodeAsDestination_edgesAreRemoved() {
        let graph = Graph<String>(isDirected: true)
        let node1 = Node<String>("one")
        let node2 = Node<String>("two")
        let node3 = Node<String>("three")
        let edge1 = Edge(source: node1, destination: node2)
        let edge2 = Edge(source: node1, destination: node3)

        graph.addEdge(edge1!)
        graph.addEdge(edge2!)
        graph.removeNode(node2)

        XCTAssertEqual(graph.adjacentNodesFromNode(node1), [node3])
    }

    func testRemoveNode_nodeDoesNotExist_noError() {
        let graph = Graph<String>(isDirected: true)
        let node1 = Node<String>("one")
        XCTAssertNoThrow(graph.removeNode(node1))
    }

    func testAddEdge_duplicateEdge() {
        let graph = Graph<String>(isDirected: true)
        let node1 = Node<String>("one")
        let node2 = Node<String>("two")
        let edge1 = Edge(source: node1, destination: node2)

        graph.addEdge(edge1!)
        graph.addEdge(edge1!)

        XCTAssertEqual(graph.adjacentNodesFromNode(node1), [node2])
    }

    func testAddEdge_undirectedGraph() {
        let graph = Graph<String>(isDirected: false)
        let node1 = Node<String>("one")
        let node2 = Node<String>("two")
        let edge1 = Edge(source: node1, destination: node2)

        graph.addEdge(edge1!)

        XCTAssert(graph.containsEdge(edge1!))
        XCTAssert(graph.containsEdge(edge1!.reverse()))
    }

    func testRemoveEdge() {
        let graph = Graph<String>(isDirected: true)
        let node1 = Node<String>("one")
        let node2 = Node<String>("two")
        let node3 = Node<String>("three")
        let edge1 = Edge(source: node1, destination: node2)
        let edge2 = Edge(source: node1, destination: node3)

        graph.addEdge(edge1!)
        graph.addEdge(edge2!)
        graph.removeEdge(edge1!)

        XCTAssert(graph.containsEdge(edge2!))
        XCTAssert(!graph.containsEdge(edge1!))
    }

    func testBreadthFirstSearchArray() {
        let graph = Graph<String>(isDirected: true)
        let node1 = Node<String>("one")
        let node2 = Node<String>("two")
        let node3 = Node<String>("three")
        let node4 = Node<String>("four")
        let node5 = Node<String>("five")
        let node6 = Node<String>("six")
        let edge1 = Edge(source: node1, destination: node2)
        let edge2 = Edge(source: node1, destination: node3)
        let edge3 = Edge(source: node2, destination: node4)
        let edge4 = Edge(source: node2, destination: node5)
        let edge5 = Edge(source: node1, destination: node6)

        graph.addEdge(edge1!)
        graph.addEdge(edge2!)
        graph.addEdge(edge3!)
        graph.addEdge(edge4!)
        graph.addEdge(edge5!)

        XCTAssertEqual(graph.breadthFirstSearch(fromNode: node1), [node1, node2, node3, node6, node4, node5])
    }

    func testDepthFirstSearchArray() {
        let graph = Graph<String>(isDirected: true)
        let node1 = Node<String>("one")
        let node2 = Node<String>("two")
        let node3 = Node<String>("three")
        let node4 = Node<String>("four")
        let node5 = Node<String>("five")
        let node6 = Node<String>("six")
        let edge1 = Edge(source: node1, destination: node2)
        let edge2 = Edge(source: node1, destination: node3)
        let edge3 = Edge(source: node2, destination: node4)
        let edge4 = Edge(source: node2, destination: node5)
        let edge5 = Edge(source: node1, destination: node6)

        graph.addEdge(edge1!)
        graph.addEdge(edge2!)
        graph.addEdge(edge3!)
        graph.addEdge(edge4!)
        graph.addEdge(edge5!)

        XCTAssertEqual(graph.depthFirstSearch(fromNode: node1), [node1, node2, node4, node5, node3, node6])
    }

    func testEdges() {
        let graph = Graph<String>(isDirected: true)
        let node1 = Node<String>("one")
        let node2 = Node<String>("two")
        let node3 = Node<String>("three")
        let node4 = Node<String>("four")
        let node5 = Node<String>("five")
        let node6 = Node<String>("six")
        let edge1 = Edge(source: node1, destination: node2)
        let edge2 = Edge(source: node1, destination: node3)
        let edge3 = Edge(source: node2, destination: node4)
        let edge4 = Edge(source: node2, destination: node5)
        let edge5 = Edge(source: node1, destination: node6)

        graph.addEdge(edge1!)
        graph.addEdge(edge2!)
        graph.addEdge(edge3!)
        graph.addEdge(edge4!)
        graph.addEdge(edge5!)

        XCTAssert(graph.edges.contains(edge1!))
        XCTAssert(graph.edges.contains(edge2!))
        XCTAssert(graph.edges.contains(edge3!))
        XCTAssert(graph.edges.contains(edge4!))
        XCTAssert(graph.edges.contains(edge5!))
    }
}
