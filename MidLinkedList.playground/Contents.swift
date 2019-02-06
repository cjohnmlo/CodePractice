//: Playground - noun: a place where people can play
// Given a linked list, print the middle element O(N)

class ListNode {
    var element : Int
    var next : ListNode?
    
    init(number: Int) {
        self.element = number
    }
    
    func append(element: Int) {
        var pointer : ListNode? = self
    
        while pointer?.next != nil {
            pointer = pointer?.next
        }
        
        pointer?.next = ListNode(number: element)
    }
    
    func printElems() {
        var pointer : ListNode? = self
        
        while pointer != nil {
            print(pointer!.element)
            pointer = pointer?.next
        }
    }
    
    func printMiddle() {
        var midPointer : ListNode? = self
        var lastPointer : ListNode? = self
        
        while lastPointer?.next?.next != nil  {
            lastPointer = lastPointer?.next?.next
            midPointer = midPointer?.next
        }
        
        print(midPointer!.element)
    }
}

var myNode = ListNode(number: 1)
myNode.append(element: 2)
myNode.append(element: 3)
myNode.append(element: 4)
myNode.append(element: 5)
myNode.append(element: 6)
myNode.append(element: 7)
myNode.append(element: 8)

myNode.printMiddle()
