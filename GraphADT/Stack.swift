/**
 A generic `Stack` class whose elements are last-in, first-out.

 - Authors: CS3217
 */
struct Stack<T> {
    private var stack = [T]()

    /// Adds an element to the top of the stack.
    /// - Parameter item: The element to be added to the stack
    mutating func push(_ item: T) {
        stack.append(item)
    }

    /// Removes the element at the top of the stack and return it.
    /// - Returns: element at the top of the stack
    mutating func pop() -> T? {
        return stack.popLast()
    }

    /// Returns, but does not remove, the element at the top of the stack.
    /// - Returns: element at the top of the stack
    func peek() -> T? {
        return stack.last
    }

    /// The number of elements currently in the stack.
    var count: Int {
        return stack.count
    }

    /// Whether the stack is empty.
    var isEmpty: Bool {
        return stack.isEmpty
    }

    /// Removes all elements in the stack.
    mutating func removeAll() {
        stack = [T]()
    }

    /// Returns an array of the elements in their respective pop order, i.e.
    /// first element in the array is the first element to be popped.
    /// - Returns: array of elements in their respective pop order
    func toArray() -> [T] {
        return stack.reversed()
    }
}
