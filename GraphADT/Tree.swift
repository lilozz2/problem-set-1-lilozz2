/**
 The `Tree` ADT.
 The following contraints must be met:
 Graph must be connected, have no cycles
 */
class Tree<T: Hashable>: Graph<T> {
    typealias N = Node<T>
    var root: N? = nil
    let key: Int

    init(key: Int) {
        self.key = key
        super.init(isDirected: true)
    }

    /// BreadthFirst Insert to the tree
    func addTreeNode(node: N) {
        guard let root = self.root else {
            self.root = node
            return
        }
        addParent(childNode: node, to: [root])
    }

    /// Helper function
    /// Adds a child node to a parent node, with possible parents being in parentNodes
    /// If parents already has more than the allowed number of children (as denoted by 'key')
    /// A search will be done for the next best parent among the children
    private func addParent(childNode: N, to parentNodes: [N]) {
        var parentFound: Bool = false
        var nextPossibleParents: [N] = []
        for parentNode in parentNodes {
            let edgeList = self.adjacencyList[parentNode, default: []]
            nextPossibleParents += edgeList.map({$0.destination})
            if edgeList.count < key {
                self.addEdge(Edge(source: parentNode, destination: childNode)!)
                parentFound = true
                break
            }
        }

        if !parentFound {
            addParent(childNode: childNode, to: nextPossibleParents)
        }
    }

    func removeTreeNode(node: N) {
        self.removeNode(node)
    }

    /// Contraints: Graph must be connected and have no cycles
    private func checkRepresentation() -> Bool {
        let isConnected = false
        let containsCycles = false

        return isConnected && !containsCycles
    }


}
