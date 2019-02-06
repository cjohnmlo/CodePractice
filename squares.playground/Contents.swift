//: Playground - noun: a place where people can play
// count the number of perfect squares from A to B

import Foundation

func countPerfectSquares(A: Int, B: Int) -> Int {
    var result = 0;
    
    result = Int(sqrt(Double(B))) - Int(ceil(sqrt(Double(A)))) + 1
    
    return result > 0 ? result : 0;
}

countPerfectSquares(A: 9, B: 10)

