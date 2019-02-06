//: Playground - noun: a place where people can play

// input : array of Int representing travel days
// 1-day ticket cost = 2
// 7-day ticket cost = 7
// 1-month ticket cost = 25
// return cheapest cost

import UIKit

let input = [1,7,14,15,18,23,25,26,27,28,29,30]

func lowestTicketPrice(inArray: [Int]) -> Int {
    
    var minCost = 0;
    var runningCost = 0;
    var bufferDays = 0;
    
    for i in 0..<inArray.count {
        i
        if i < 3 {
            // just buy one day tickets.
            runningCost += 2
        }
        else {
            // check if 7 day tickets are worth it
            
            if bufferDays > 0 {
                //can be within in our 7 day ticket
                //print(bufferDays)
                if inArray[i] - inArray[i-1] <= bufferDays {
                    bufferDays -= inArray[i] - inArray[i-1]
                    continue
                }
                else {
                    bufferDays = 0
                }
            }
            
            if runningCost + 2 > 7 {
                //check last 4 days if can be contained in a week
                print(inArray[i])
                if (inArray[i] - inArray[i-3] <= 7) {
                    minCost += runningCost + 1;
                    runningCost = 0;
                    bufferDays = abs(inArray[i-3] + 6 - inArray[i]);
                    
                }
                else {
                    runningCost += 2;
                }
            }
            else {
                runningCost += 2;
            }
        }
    }
    
    return min(minCost + runningCost, 25)
}

lowestTicketPrice(inArray: input)
