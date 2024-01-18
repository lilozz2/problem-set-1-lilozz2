/**
 A generic `Queue` class whose elements are first-in, first-out.

 - Authors: CS3217
 */
struct Queue<T> {
    private var queue = [T]()

    /// Adds an element to the tail of the queue.
    /// - Parameter item: The element to be added to the queue
    mutating func enqueue(_ item: T) {
        queue.append(item)
    }

    /// Removes an element from the head of the queue and return it.
    /// - Returns: item at the head of the queue
    mutating func dequeue() -> T? {
        return queue.isEmpty ? nil : queue.removeFirst()
    }

    /// Returns, but does not remove, the element at the head of the queue.
    /// - Returns: item at the head of the queue
    func peek() -> T? {
        return queue.first
    }

    /// The number of elements currently in the queue.
    var count: Int {
        return queue.count
    }

    /// Whether the queue is empty.
    var isEmpty: Bool {
        return queue.isEmpty
    }

    /// Removes all elements in the queue.
    mutating func removeAll() {
        queue = [T]()
    }

    /// Returns an array of the elements in their respective dequeue order, i.e.
    /// first element in the array is the first element to be dequeued.
    /// - Returns: array of elements in their respective dequeue order
    func toArray() -> [T] {
        return queue
    }
}
