import Foundation

extension String {
    /// Encrypts a string by using `key`.
    /// - Parameter key: an integer used for encryption
    /// - Returns: the new encrypted string
    func encipherWithKey(_ key: Int) -> String {
        let stringWithFillerChars = self.addTrailingFillerChars()

        let tree = Tree<String>(key: key)
        var id: Int = 0 // Id is used to create unique label in the case where letters are the same
        for char in stringWithFillerChars {
            id += 1
            tree.addTreeNode(node: Node(String(char) + String(id)))
        }
        var output = String(tree.depthFirstTraversal().flatMap({$0.prefix(1)}))

        return output.replacingOccurrences(of: "[\\*]+$", with: "", options: .regularExpression)
    }

    /// Appends trailing "*"s to the String based on the depth of the tree that will be generated
    func addTrailingFillerChars() -> String {
        let depthArray = Array(0...self.getMaxDepth())
        let totalNoOfChars = depthArray.reduce(0, { x, y in
            x + Int(pow(2.0, Double(y)))
        })

        var outputString = self
        let noOfCharsToAdd = totalNoOfChars - self.count
        for _ in 0..<noOfCharsToAdd {
            outputString += ["*"]
        }
        
        return outputString
    }

    /// Takes in a string and returns the maximum depth of the complete binary tree that it will populate
    ///  - Parameter string: the string that will be used
    func getMaxDepth() -> Int {
        var strLen: Int = self.count
        var depth: Int = 0
        while strLen > Int(pow(2.0, Double(depth))) {
            strLen -= Int(pow(2.0, Double(depth)))
            depth += 1
        }
        return depth
    }

    /// Decrypts a string by using `key`.
    /// - Parameter key: an integer used for decryption
    /// - Returns: the new decrypted string
    func decipherWithKey(_ key: Int) -> String {
        let tree = Tree<String>(key: key)
        var id: Int = 0
        for char in self {
            id += 1
            tree.addTreeNode(node: Node(String(char) + String(id)))
        }
        return String(tree.breadthFirstTraversal().flatMap({$0.prefix(1)}))
    }
}
