//: Playground - noun: a place where people can play

var string1 = "Apple"
var string2 = "Aplep"


func isAnagram(string1: String, string2: String) -> Bool {
    var s2copy : String = string2
    for c in string1 {
        if s2copy.contains(c) {
            s2copy.remove(at: s2copy.index(of: c)!)
        }
        else {
            return false
        }
    }
    
    if s2copy.count == 0 {
        return true
    }
    else {
        return false
    }
}

isAnagram(string1: string1, string2: string2)
