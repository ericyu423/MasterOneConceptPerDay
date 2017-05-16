# Functions - type Alias usage 


# The following are equivalent

        var simpleMathOperator1: (Double, Double) -> Double
        
        -----------------------------------------------------------------------   
        
        typealias SimpleOperator = (Double, Double) -> Double
        var simpleMathOperator2: SimpleOperato
        
       -----------------------------------------------------------------------        

        func addTwoNumbers(a: Double, b: Double) -> Double { return a + b }
        func subtractTwoNumbers(a: Double, b: Double) -> Double { return a - b }
        func divideTwoNumbers(a: Double, b: Double) -> Double { return a / b }
        func multiplyTwoNumbers(a: Double, b: Double) -> Double { return a * b }



          simpleMathOperator1 = multiplyTwoNumbers
          simpleMathOperator2 = multiplyTwoNumbers

#The following give same results as expected

          print(simpleMathOperator1(3.0, 4.0))
          print(simpleMathOperator2(3.0, 4.0))
          
#Function Composition 

          let textString = "10,20,40,30,80,60"
  1)
          func seperateElements(_ textString: String) -> [String] {
                      
                let array:[String] = content.characters.split(separator: ",").map { String($0)}
                //[10,20,40,30,80,60]
                return array
          }
  2)
         func formatNumWithDollarSign(textString: [String]) -> [String] {
         
                let array:[String] = content.map {"\($0)$"}
                return array
      
         }
         
         
step 1. taking comma separated files and break in in to an array of string
step 2. go through the array and add "$" 

# Translate the above in a functional way
        
        






