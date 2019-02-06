//: Playground - noun: a place where people can play
// DFS and BFS implementation on Tree or a simple graph (implemented using the Vertex below)

protocol Graphable {
    var visited: Bool {get set}
    func printKey()
    func getNeighbors() -> [Graphable]
}

func DFS(root: Graphable) {
    let dfsStack = Stack<Graphable>()
    
    //root.visited = true;
    root.printKey()
    for node in root.getNeighbors() {
        if !node.visited {
            dfsStack.push(elem: node)
        }
    }
    
    while (dfsStack.peek() != nil) {
        guard var next = dfsStack.pop() else {
            return
        }
        
        next.visited = true
        next.printKey()
        for node in next.getNeighbors() {
            if !node.visited {
                dfsStack.push(elem: node)
            }
        }
    }
}

func BFS(root: Graphable) {
    let bfsQueue = Queue<Graphable>()

    //root.visited = true;
    root.printKey()
    for node in root.getNeighbors() {
        if !node.visited {
            bfsQueue.enqueue(elem: node)
        }
    }
    
    while (bfsQueue.count() != 0) {
        guard var next = bfsQueue.dequeue() else {
            return
        }
        
        next.visited = true
        next.printKey()
        for node in next.getNeighbors() {
            if !node.visited {
                bfsQueue.enqueue(elem: node)
            }
        }
    }
    
}

class Queue<T> {
    var array : [T] = []
    
    func enqueue(elem: T) {
        array.append(elem)
    }
    
    func dequeue() -> T? {
        if (array.count > 0) {
            return array.remove(at: 0)
        }
        else {
            return nil
        }
    }
    
    func count() -> Int {
        return array.count
    }
    
}

class Stack<T> {
    var array : [T] = []
    
    func push(elem: T) {
        array.append(elem)
    }
    
    func pop() -> T? {
        if array.count > 0 {
            return array.popLast()
        }
        else {
            return nil
        }
    }
    
    func peek() -> T? {
        return array.last
    }
    
}

//let myQueue : Queue<Int> = Queue()
//let myStack : Stack<Int> = Stack()
//
//myQueue.dequeue()
//myQueue.enqueue(elem: 0)
//myQueue.enqueue(elem: 1)
//myQueue.enqueue(elem: 2)
//myQueue.dequeue()
//myQueue.dequeue()
//myQueue.dequeue()
//myQueue.dequeue()
//
//myStack.push(elem: 0)
//myStack.push(elem: 1)
//myStack.push(elem: 2)
//
//myStack.pop()
//myStack.pop()
//myStack.push(elem:3)
//myStack.pop()
//myStack.peek()
//myStack.pop()

class TreeNode<T: Comparable> {
    var val : T
    var leftChild : TreeNode?
    var rightChild : TreeNode?
    var visited: Bool
    
    init(val: T) {
        self.val = val
        self.visited = false
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

extension TreeNode: Graphable {
    
    func printKey() {
        print(val)
    }
    
    func getNeighbors() -> [Graphable] {
        var children: [TreeNode] = []
        
        if let leftChild = leftChild {
            children.append(leftChild)
        }
        
        if let rightChild = rightChild {
            children.append(rightChild)
        }
        
        return children
    }
}

class Vertex : Graphable {
    var visited: Bool = false
    var vertices : [Vertex] = []
    var val : Int
    
    func getNeighbors() -> [Graphable] {
        return vertices
    }
    
    func printKey() {
        print(val)
    }
    
    init(val: Int) {
        self.val = val
    }
}

let inputArray = [5,4,6,3,2,8,1,7,9,10,11,12,13]

var myTree = TreeNode(val: inputArray[0])

for i in 1..<inputArray.count {
    myTree.addNode(val: inputArray[i])
}

BFS(root: myTree)
DFS(root: myTree)


var one = Vertex(val: 1)
var two = Vertex(val: 2)
var three = Vertex(val: 3)
var four = Vertex(val: 4)
var five = Vertex(val: 5)
var six = Vertex(val: 6)
var seven = Vertex(val: 7)

seven.vertices.append(five)
six.vertices.append(seven)
two.vertices.append(six)
four.vertices.append(five)
three.vertices.append(five)

one.vertices.append(two)
one.vertices.append(three)
one.vertices.append(four)

three.vertices
//BFS(root: one)








