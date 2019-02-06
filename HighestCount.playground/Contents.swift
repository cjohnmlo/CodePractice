//: Playground - noun: a place where people can play
// Given an Array
// determine the elements with the highest occurence
// generic implementation

let intArray = [1,2,3,4,5,6,1,2,3,31,4,1,123,31,2,12,3,13,2,1,2,1,3,3,3,31,2]
let inString = ["John", "John","John","John","John","John", "Rah", "Rah", "Rah", "Rah", "Rah", "Rah", "Rah", "Jorahn", "Jorahn", "Jorahn", "Jorahn"]
let infloat = [1.2, 1.2, 1.2, 1.2, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5]

func determineHighestCount<T: Hashable>(inArray:[T]) -> [T]? {
    var countDictionary : Dictionary<T, Int> = [:]
    var maxCounts : [T]?
    
    for i in inArray {
        if let currentIntCount = countDictionary[i] {
            countDictionary[i] = currentIntCount + 1
        }
        else {
            countDictionary[i] = 1
        }
    }
    
    let maxValue = countDictionary.values.max()
    
    if let maxValue = maxValue {
        let maxCountsDictionary = countDictionary.filter {
            $0.1 == maxValue
        }
        maxCounts = [T](maxCountsDictionary.keys)
    }
    else {
        print("No max Value??")
    }
    
    return maxCounts
}

determineHighestCount(inArray: intArray)
determineHighestCount(inArray: inString)
determineHighestCount(inArray: infloat)
var myArray = intArray
myArray.sorted(by: <)
