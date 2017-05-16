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
