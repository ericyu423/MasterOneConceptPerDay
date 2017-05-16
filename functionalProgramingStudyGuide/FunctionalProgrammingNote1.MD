# Functional Programmming

you try to follow the basic mathematical function where

y = f(x)  in other words f(x) -> y

# Pure Functions

* they don't change or alter data outside of themselves, Pure functions are suitable for concurrency as they do not access and change global data or states example:  

  conterexamples:

  Printing a String literal to a console is not pure as it modifies an external state.
  
  Reading a file is not pure as it depends on the external state at different times.
  
  Getting the current date is not pure as it returns different values when called at different dates.
  
  Getting a random number is not pure as it returns different values each time it is called.
  
  only example:
  
  Length of a String is pure as it does not rely on a state. It only takes a String as input and returns the length as output.
  

My Question? Length of a string can depend on what string you put in how is that different than reading a file
unless the string is an immutable 'let'.





# Playing with Functions

example:

        func choosePlusMinus(isPlus: Bool) -> (Int, Int) -> Int {
            func plus(a: Int, b: Int) -> Int {
                return a + b }
           func minus(a: Int, b: Int) -> Int {
               return a - b }
          return isPlus ? plus : minus
        }



        let p = choosePlusMinus(isPlus: true)
        p(3,4) ---> 7

        let m = choosePlusMinus(isPlus: false)
         m(3,4) ----> -1
         
         
 basically we are creating a 2 new functions using a "function creator" 
 
p is just another name for "func plus" 
m is just another name for "func minus"


we don't have to put names in

      func choosePlusMinus(isPlus: Bool) -> (Int, Int) -> Int {
         if isPlus {
              return {
                  (a: Int, b: Int) in
                      a + b
              }
         }else{

              return {
                  (a: Int, b: Int) in
                          a - b
              }
          }
      }
     
     
makes it it to a switch 

        func choosePlusMinus(isPlus: Bool) -> (Int, Int) -> Int {
           switch isPlus
           {
           case true:
                return {
                    (a: Int, b: Int) in
                    a + b
                }
           case false:
                return {
                    (a: Int, b: Int) in
                    a - b
                }
            }
        }
        
even more simplifed 

        func choosePlusMinus(isPlus: Bool) -> (Int, Int) -> Int {
           switch isPlus
           {
           case true:
                return {$0 + $1}
           case false:
                return {$0 - $1}
            }
        }
        
        
        
        func choosePlusMinus(isPlus: Bool) -> (Int, Int) -> Int {
           switch isPlus
           {
           case true:
                return (+)
           case false:
                return (-)
            }
        }
        
they all works but I like the one with function name, is more descriptive 


Bonus: typealias

          typealias SimpleOperator = (Double, Double) -> Double

          var simpleMathOperator: SimpleOperator
          
          func addTwoNumbers(a: Double, b: Double) -> Double { return a + b }
          func subtractTwoNumbers(a: Double, b: Double) -> Double { return a - b }
          func divideTwoNumbers(a: Double, b: Double) -> Double { return a / b }
          func multiplyTwoNumbers(a: Double, b: Double) -> Double { return a * b }

          simpleMathOperator = addTwoNumbers

          func calculateResult(mathOperator: SimpleOperator, a: Double, b: Double)
              -> Double {
                  return mathOperator(a, b)
          }


          print(calculateResult(mathOperator: simpleMathOperator,
              a: 3.5, b: 5.5))



...to be continued



