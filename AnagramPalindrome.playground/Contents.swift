extension String {
    func isPalindrome() -> Bool {
        for i in 0..<self.count {
            let firstIndex = String.Index.init(encodedOffset: i)
            let secondIndex = String.Index.init(encodedOffset: self.count - i - 1)
            if self[firstIndex] != self[secondIndex] {
                return false
            }
        }
        return true
    }
    
    func isAnagram(with otherString: String) -> Bool {
        var dictionary1 : Dictionary<String, Int> = [:]
        var dictionary2 : Dictionary<String, Int> = [:]
        
        self.forEach { (char) in
            let stringified = String(char)
            if let occurence = dictionary1[stringified] {
                dictionary1[stringified] = occurence + 1
            }
            else {
                dictionary1[stringified] = 1
            }
        }
        
        otherString.forEach { (char) in
            let stringified = String(char)
            if let occurence = dictionary2[stringified] {
                dictionary2[stringified] = occurence + 1
            }
            else {
                dictionary2[stringified] = 1
            }
        }
        
        return dictionary1 == dictionary2
    }
}

var palindrome = "racecar"
print(palindrome.isPalindrome())
var thing = "thing"
print(thing.isAnagram(with: "night"))
print(thing.isAnagram(with: "apple"))
