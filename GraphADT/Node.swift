/**
 `Node` represents a vertex in a graph. `Node` is a generic type with a type
 parameter `T` that is the type of the node's label. For example, `Node<String>`
 is the type of nodes with a `String` label and `Node<Int>` is the type of nodes
 with a `Int` Label.

 Because we need to compare the node label, the type parameter `T` needs to
 conform to `Equatable` protocol.

 - Authors: CS3217
 */
struct Node<T: Hashable>: Hashable {
    var label: T

    /// Creates a `Node` with the given `label`.
    init(_ label: T) {
        self.label = label
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(label)
    }
}

// MARK: Equatable
extension Node: Equatable {
}
