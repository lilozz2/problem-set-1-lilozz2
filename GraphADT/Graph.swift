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
class Graph<T: Hashable> {
    typealias N = Node<T>
    typealias E = Edge<T>

    let isDirected: Bool

    var adjacencyList: [N: [E]] = [:]

    /// Constructs a directed or undirected graph.
    init(isDirected: Bool) {
        self.isDirected = isDirected
    }

    /// Adds the given node to the graph.
    /// If the node already exists in the graph, do nothing.
    func addNode(_ addedNode: N) {
        adjacencyList[addedNode] = adjacencyList[addedNode] ?? []
    }

    /// Remove the given node from the graph.
    /// If the node does not exist in the graph, do nothing.
    func removeNode(_ removedNode: N) {
        // Removes edges where node is destination
        adjacencyList = adjacencyList.mapValues { edgeList in
            return edgeList.filter({!$0.hasNode(removedNode)})
        }
        adjacencyList.removeValue(forKey: removedNode)
    }

    /// Whether the graph contains the requested node.
    /// - Returns: true if the node exists in the graph
    func containsNode(_ targetNode: N) -> Bool {
        return adjacencyList.keys.contains(targetNode)
    }

    /// Adds the given edge to the graph.
    /// If the edge already exists, do nothing. If any of the nodes referenced
    /// in the edge does not exist, it is added to the graph.
    func addEdge(_ addedEdge: E) {
        let sourceNode = addedEdge.source
        let destinationNode = addedEdge.destination
        self.addNode(sourceNode)
        self.addNode(destinationNode)

        if adjacencyList[sourceNode, default: []].contains(addedEdge) {
            return
        } else if adjacencyList[sourceNode, default: []].contains(addedEdge.reverse()) && !isDirected {
            // if reverse edge is added while graph is undirected, duplicates will be created
            return
        }

        adjacencyList[sourceNode, default: []].append(addedEdge)

        if !isDirected {
            adjacencyList[destinationNode, default: []].append(addedEdge.reverse())
        }
    }

    /// Removes the requested edge from the graph. If it does not exist, do
    /// nothing.
    func removeEdge(_ removedEdge: E) {
        let sourceNode = removedEdge.source
        let edgeList = adjacencyList[sourceNode, default: []]
        adjacencyList[sourceNode] = edgeList.filter { $0 != removedEdge }
    }

    /// Whether the requested edge exists in the graph.
    /// - Returns: true if the requested edge exists.
    func containsEdge(_ targetEdge: E) -> Bool {
        let sourceNode = targetEdge.source
        return adjacencyList[sourceNode, default: []].contains(targetEdge)
    }

    /// Returns adjacent edges directed from `fromNode` to `toNode`. If one of
    /// the nodes does not exist, returns an empty array.
    /// - Parameters:
    ///   - fromNode: the source `Node`
    ///   - toNode: the destination `Node`
    /// - Returns: an array of `Edge`s
    func edgesFromNode(_ fromNode: N, toNode: N) -> [E] {
        let edge = Edge(source: fromNode, destination: toNode)
        let fromEdges = adjacencyList[fromNode, default: []].filter({$0 != edge})
        let toEdges = adjacencyList[fromNode, default: []]
        return fromEdges + toEdges
    }

    /// Returns adjacent nodes of the `fromNode`, i.e. there is a directed edge
    /// from `fromNode` to its adjacent node. If the requested node does not
    /// exist, returns an empty array.
    /// - Parameters:
    ///   - fromNode: the source `Node`
    /// - Returns: an array of `Node`s
    func adjacentNodesFromNode(_ fromNode: N) -> [N] {
        guard let edgeList = adjacencyList[fromNode] else { return [] }
        return edgeList.map { $0.destination }
    }

    /// A read-only computed property that contains all the nodes
    /// of the graphs.
    var nodes: [N] {
        return Array(adjacencyList.keys)
    }

    /// A read-only computed property that contains all the edges
    /// of the graphs.
    var edges: [E] {
        return adjacencyList.values.flatMap({$0})
    }

    /// Performs a breadth first search from `fromNode`, and returns the nodes
    /// searched.
    /// - Parameters:
    ///   - fromNode: the source `Node`
    /// - Returns: an aray of nodes that contain all nodes in the same component
    /// as `fromNode`, in the order of a possible breadth first search.
    func breadthFirstSearch(fromNode: N) -> [N] {
        var breadthFirstArray: [N] = []
        var queue = Queue<N>()
        queue.enqueue(fromNode)

        while !queue.isEmpty {
            let node = queue.dequeue()
            breadthFirstArray.append(node!)
            adjacencyList[node!, default: []].forEach({queue.enqueue($0.destination)})
        }

        return breadthFirstArray
    }

    /// Performs a depth first search from `fromNode`, and returns the nodes
    /// searched.
    /// - Parameters:
    ///   - fromNode: the source `Node`
    /// - Returns: an aray of nodes that contain all nodes in the same component
    /// as `fromNode`, in the order of a possible depth first search.
    func depthFirstSearch(fromNode: N) -> [N] {
        var depthFirstArray: [N] = []
        var stack = Stack<N>()
        stack.push(fromNode)

        while !stack.isEmpty {
            let node = stack.pop()
            depthFirstArray.append(node!)
            adjacencyList[node!, default: []].reverse() // push edges in reverse order
            adjacencyList[node!, default: []].forEach({stack.push($0.destination)})
        }

        return depthFirstArray
    }

    /// Checks the representation invariants.
    private func checkRepresentation() -> Bool {
        let isUniqueLabels = adjacencyList.keys.count == Set(adjacencyList.keys).count
        /// We only need to check for unique labels because isDirected enforces that the graph is either directed or undirected
        /// and addEdge cannot add duplicate edges (in which weights are also considered)
        return isUniqueLabels
    }
}
