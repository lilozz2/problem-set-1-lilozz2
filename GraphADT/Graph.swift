/**
 The `Graph` ADT is able to represent the following graph types with
 corresponding constraints:
 - Undirected graph
   + An undirected edge is represented by 2 directed edges
 - Directed graph
 - Simple graph
 - Multigraph
   + Edges from the same source to the same destination should have
 different cost
 - Unweighted graph
   + Edges' weights are to set to 1.0
 - Weighted graph

 Hence, the representation invariants for every Graph g:
 - g is either directed or undirected
 - All nodes in g must have unique labels
 - Multiple edges from the same source to the same destination must
 not have the same weight

 Similar to `Node` and `Edge`, `Graph` is a generic type with a type parameter
 `T` that defines the type of the nodes' labels.

 - Authors: CS3217
 */
class Graph<T: Equatable> {
    typealias N = Node<T>
    typealias E = Edge<T>

    let isDirected: Bool

    /// Constructs a directed or undirected graph.
    init(isDirected: Bool) {
        // TODO: Replace/remove the following line in your implementation.
        self.isDirected = false
    }

    /// Adds the given node to the graph.
    /// If the node already exists in the graph, do nothing.
    func addNode(_ addedNode: N) {
        // TODO: Fill in this function.
    }

    /// Remove the given node from the graph.
    /// If the node does not exist in the graph, do nothing.
    func removeNode(_ removedNode: N) {
        // TODO: Fill in this function.
    }

    /// Whether the graph contains the requested node.
    /// - Returns: true if the node exists in the graph
    func containsNode(_ targetNode: N) -> Bool {
        // TODO: Replace/remove the following line in your implementation.
        return false
    }

    /// Adds the given edge to the graph.
    /// If the edge already exists, do nothing. If any of the nodes referenced
    /// in the edge does not exist, it is added to the graph.
    func addEdge(_ addedEdge: E) {
        // TODO: Fill in this function.
    }

    /// Removes the requested edge from the graph. If it does not exist, do
    /// nothing.
    func removeEdge(_ removedEdge: E) {
        // TODO: Fill in this function.
    }

    /// Whether the requested edge exists in the graph.
    /// - Returns: true if the requested edge exists.
    func containsEdge(_ targetEdge: E) -> Bool {
        // TODO: Replace/remove the following line in your implementation.
        return false
    }

    /// Returns adjacent edges directed from `fromNode` to `toNode`. If one of
    /// the nodes does not exist, returns an empty array.
    /// - Parameters:
    ///   - fromNode: the source `Node`
    ///   - toNode: the destination `Node`
    /// - Returns: an array of `Edge`s
    func edgesFromNode(_ fromNode: N, toNode: N) -> [E] {
        // TODO: Replace/remove the following line in your implementation.
        return [E]()
    }

    /// Returns adjacent nodes of the `fromNode`, i.e. there is a directed edge
    /// from `fromNode` to its adjacent node. If the requested node does not
    /// exist, returns an empty array.
    /// - Parameters:
    ///   - fromNode: the source `Node`
    /// - Returns: an array of `Node`s
    func adjacentNodesFromNode(_ fromNode: N) -> [N] {
        // TODO: Replace/remove the following line in your implementation.
        return [N]()
    }

    /// A read-only computed property that contains all the nodes
    /// of the graphs.
    var nodes: [N] {
        // TODO: Replace/remove the following line in your implementation.
        return [N]()
    }

    /// A read-only computed property that contains all the edges
    /// of the graphs.
    var edges: [E] {
        // TODO: Replace/remove the following line in your implementation.
        return [E]()
    }

    /// Performs a breadth first search from `fromNode`, and returns the nodes
    /// searched.
    /// - Parameters:
    ///   - fromNode: the source `Node`
    /// - Returns: an aray of nodes that contain all nodes in the same component
    /// as `fromNode`, in the order of a possible breadth first search.
    func breadthFirstSearch(fromNode: N) -> [N] {
        // TODO: Replace/remove the following line in your implementation.
        return [N]()
    }

    /// Performs a depth first search from `fromNode`, and returns the nodes
    /// searched.
    /// - Parameters:
    ///   - fromNode: the source `Node`
    /// - Returns: an aray of nodes that contain all nodes in the same component
    /// as `fromNode`, in the order of a possible depth first search.
    func depthFirstSearch(fromNode: N) -> [N] {
        // TODO: Replace/remove the following line in your implementation.
        return [N]()
    }

    /// Checks the representation invariants.
    private func checkRepresentation() -> Bool {
        // TODO: Replace/remove the following line in your implementation.
        return true
    }
}
