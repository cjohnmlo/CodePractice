
let coins = [1,2,4]
let sum = 2018

// brute forced, greedy
func getLeastCoins(input arr: [Int], target: Int) -> Int {
    
    var candidateAnswers : [Int] = []
    
    for i in arr.reversed() {
        var remainingTarget = target
        var numCoins = 0
        var j = arr.lastIndex(of: i)!
        
        while j >= 0 {
            numCoins = numCoins + remainingTarget / arr[j]
            remainingTarget = remainingTarget % arr[j]
            
            if remainingTarget == 0 {
                candidateAnswers.append(numCoins)
                break
            }
            j = j - 1
        }
    }
    
    if candidateAnswers.count != 0 {
        return candidateAnswers.min()!
    }
    
    return 0
}

print(getLeastCoins(input: coins, target: sum))
