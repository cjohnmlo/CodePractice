struct MyDictionary<Key: Hashable, Value: Any> {
    
    // can increase storage size.
    // higher storage size = higher memory requirements = lower access time = reduced collisions
    // lower storage size = lower memory requirements = higher access time = higher collisions
    // set to 2 for testing
    private let storageLimit = 2
    private var arrStorage : [[DictNode]?] = Array(repeating: nil, count: 2)
    
    
    mutating func set(value:Value, forKey key: Key) {
        let index = self.indexOfHash(key: key)
        
        if var currentVal = arrStorage[index] {
            for (index, dictNode) in currentVal.enumerated() {
                if dictNode.key == key {
                    currentVal.remove(at: index)
                }
            }
            arrStorage[index] = currentVal + [DictNode(key: key, value: value)]
        }
        else {
            arrStorage[index] = [DictNode(key: key, value: value)]
        }
      
    }

    func getValue(forKey key:Key) -> Value? {
        let index = self.indexOfHash(key: key)
        
        if let value = arrStorage[index] {
            for dictNode in value {
                if key == dictNode.key {
                    return dictNode.value
                }
            }
        }
        return nil
    }
    
    mutating func deleteValue(forKey key:Key) {
        let index = self.indexOfHash(key: key)
        
        if var value = arrStorage[index] {
            for (arrindex, dictNode) in value.enumerated() {
                if key == dictNode.key {
                    value.remove(at: arrindex)
                }
            }
            
            arrStorage[index] = value
        }
        
    }
    
    private struct DictNode {
        let key : Key
        var value : Value
    }
    
    private func indexOfHash(key : Key) -> Int {
        return abs(key.hashValue) % storageLimit
    }
    
    subscript(key: Key) -> Value? {
        get {
            return self.getValue(forKey: key)
        }
        set(newValue) {
            if let newVal = newValue {
                self.set(value: newVal, forKey: key)
            }
            else {
                self.deleteValue(forKey: key)
            }
        }
    }
}

var myDict = MyDictionary<String, Int>()

// 3 samples gaurantees a collision (pigeon hole principle)
myDict.set(value: 100, forKey: "100")
myDict["95"] = 95
myDict["10"] = 10
myDict.set(value: 40, forKey: "40")
myDict.set(value: 50, forKey: "50")
myDict.set(value: 51, forKey: "50")
myDict.set(value: 52, forKey: "50")

print(myDict.getValue(forKey: "100"))
print(myDict.getValue(forKey: "95"))
print(myDict.getValue(forKey: "50"))
print(myDict.getValue(forKey: "40"))

print("====")
myDict.deleteValue(forKey: "50")
myDict["95"] = nil
print(myDict.getValue(forKey: "100"))
print(myDict.getValue(forKey: "95"))
print(myDict.getValue(forKey: "50"))
print(myDict.getValue(forKey: "40"))

