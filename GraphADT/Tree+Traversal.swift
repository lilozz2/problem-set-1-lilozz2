/**
 Extension for `Tree` traversal.
 */
extension Tree {
    /// Returns an array that represents the tree when it is traversed
    /// in breadth-first order.
    /// - Returns: an array of all elements in the tree in breadth-first order
    func breadthFirstTraversal() -> [T] {
        guard let root = self.root else { return [T]() }
        return self.breadthFirstSearch(fromNode: root).map({$0.label})
    }

    /// Returns an array that represents the tree when it is traversed
    /// in depth-first order.
    /// - Returns: an array of all elements in the tree in depth-first order
    func depthFirstTraversal() -> [T] {
        guard let root = self.root else { return [T]() }
        return self.depthFirstSearch(fromNode: root).map({$0.label})
    }
}
