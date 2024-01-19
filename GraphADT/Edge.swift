/**
 `Edge` represents an edge in a graph. An `Edge` is associated with a source
 Node, a destination Node and a non-negative cost (or weight). This means that
 `Edge` is a directed edge from the source to the destination.

 The representation invariants:
 - The weight is non-negative

 Similar to `Node`, `Edge` is a generic type with a type parameter `T` that is
 the type of a node's label.

 - Authors: CS3217
 */
struct Edge<T: Hashable> {
    typealias N = Node<T>

    let source: N
    let destination: N
    let weight: Double

    /// Constructs an `Edge` from `source` to `destination` with the
    /// default cost of 1.0.
    /// - Parameters
    ///   - source: The source `Node`
    ///   - destination: The destination `Node`
    init?(source: N, destination: N) {
        self.init(source: source, destination: destination, weight: 1.0)
        assert(checkRepresentation())
    }

    /// Constructs an `Edge` from `source` to `destination` with the
    /// cost of `weight`.
    /// - Parameters
    ///   - source: The source `Node`
    ///   - destination: The destination `Node`
    ///   - weight: The cost of the `Edge`
    init?(source: N, destination: N, weight: Double) {
        self.source = source
        self.destination = destination
        if weight < 0 {
            return nil
        }
        self.weight = weight
        assert(checkRepresentation())
    }

    /// Returns an edge in the opposite direction with the same cost.
    func reverse() -> Edge<T> {
        return Edge(source: destination, destination: source, weight: weight)!
    }

    /// Checks if an edge contains a particular node.
    /// - Parameters
    ///   - node: The node to be searched for
    func hasNode(_ node: N) -> Bool {
        return self.source == node || self.destination == node
    }

    /// Checks the representation invariants.
    private func checkRepresentation() -> Bool {
        return weight >= 0
    }
}

// MARK: Equatable
extension Edge: Equatable {
}
