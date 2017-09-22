* This is not correct for every test case


import Foundation

// Enter your code here 
//goal roate array n time to the front
var inputString = ""

while let line = readLine() {
    inputString += line + " "
}

let mylin = inputString.components(separatedBy: [" "]).map { String($0)! }

let sizeArray: Int! = Int(mylin[0])

let shiftNumtimes: Int! = Int(mylin[1])


var rArray = [Int](repeating: 0, count: sizeArray)

for index in 2...sizeArray + 1 {

    rArray[(index - 1)%(shiftNumtimes+1)] = Int(mylin[index])!
}

var myString = ""
for index in 0...rArray.count - 1 {
    myString += String(rArray[index]) + " "
}

print(myString)
