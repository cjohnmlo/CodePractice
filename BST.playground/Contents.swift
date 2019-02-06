//: Playground - noun: a place where people can play

class TreeNode<T: Comparable> {
    var val : T
    var leftChild : TreeNode?
    var rightChild : TreeNode?
    
    init(val: T) {
        self.val = val
    }
    
    func searchNode(val: T) -> TreeNode? {
        if self.val == val {
            return self
        }
        if self.val > val {
            if let leftChild = leftChild {
                return leftChild.searchNode(val: val)
            }
            else {
                return nil
            }
        }
        else {
            if let rightChild = rightChild {
                return rightChild.searchNode(val: val)
            }
            else {
                return nil
            }
        }
     }
    
    func addNode(val: T) {
        
        if self.val > val {
            if let leftChild = leftChild {
                leftChild.addNode(val: val)
            }
            else {
                leftChild = TreeNode(val: val)
            }
        }
        else {
            if let rightChild = rightChild {
                rightChild.addNode(val: val)
            }
            else {
                rightChild = TreeNode(val: val)
            }
        }
    }

    func getHeight() -> Int {
        var leftHeight = 0
        var rightHeight = 0
        
        if let leftChild = leftChild {
            leftHeight = leftChild.getHeight()
        }

        if let rightChild = rightChild {
            rightHeight = rightChild.getHeight()
        }

        return max(leftHeight,rightHeight) + 1
    }
    
    func printPreorder() {
        print(self.val)
        if let leftChild = leftChild {
            leftChild.printPreorder()
        }

        if let rightChild = rightChild {
            rightChild.printPreorder()
        }
    }
    
    func printInOrder() {
        if let leftChild = leftChild {
            leftChild.printInOrder()
        }

        print(self.val)

        if let rightChild = rightChild {
            rightChild.printInOrder()
        }
    }
}


let inputArray = [9,5,2,3,8,6,19,7,10,11,12,15,13]
//let inputArray = [9,5,2,10,11]
let rootNode = TreeNode(val: inputArray[0])

for i in 1..<inputArray.count {
    rootNode.addNode(val: inputArray[i])
}

//rootNode.printInOrder()
//print(rootNode.getHeight())
let searchResult = rootNode.searchNode(val: 17)
if let searchRes = searchResult {
    print(searchRes.val)
}
else {
    print("Not Found")
}
