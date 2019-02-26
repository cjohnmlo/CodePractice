// Binary search as an Array extension/
// Recursive implementation
// returns the index of the element
// Generic, works on Array of Comparables

extension Array where Element : Comparable {
    
    func binarySearch(element: Element) -> Int? {
        assert(self.isSorted(<), "Array is not sorted")
        return recursiveBinarySearch(element: element, array: self)
    }
    
    private func recursiveBinarySearch(element: Element, array: Array<Element>) -> Int? {
        
        if array.count == 1 {
            if array[0] == element {
                return 0
            }
            else {
                return nil
            }
        }
        
        if array[array.count/2] == element {
            return array.count/2
        }
        
        if array[array.count/2] > element {
            let newArray = array[0..<array.count/2];
            return recursiveBinarySearch(element: element, array: Array(newArray))
        }
        
        if array[array.count/2] < element {
            let newArray = array[array.count/2..<array.count];
            if let rightHandIndex = recursiveBinarySearch(element: element, array: Array(newArray)) {
                return array.count/2 + rightHandIndex
            }
            else {
                return nil
            }
        }
        
        return nil
    }
    
    func isSorted(_ sortingClosure: (Element, Element) -> Bool) -> Bool {
        if (self.count <= 1) {
            return true
        }
        
        for index in 1..<self.count {
            if (!sortingClosure(self[index-1], self[index])){
                return false
            }
        }
        
        return true
    }
}

// works on strings too!
let sampleArray = [1,2,3,4,5,6,7,8,9,10]
let sampleStrings = ["a","b","c","d","e","f"]

//using random will assert to false when using binary search
// Must be sorted before using
//let sampleArray = [5,2,1,10,9,3,4,8,7,6]

print(sampleStrings.binarySearch(element: "z"))
print(sampleArray.binarySearch(element: 3))
