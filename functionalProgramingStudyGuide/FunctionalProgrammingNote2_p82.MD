# Memorization







# Curried

basically definting a function that can be used to define another function while setting a variable 

func curried take and x in and define a function (String)->Float which is define by closure
          {
              (y: String) -> Float in
              return Float(x) + Float(y)!
          }

        func curried(x: Int) -> (String) -> Float {
            return {(y: String) -> Float in
                return Float(x) + Float(y)!
            }
        }

        let x = curried(x: 1)   // (String) -> Float
        let y = x("2")

        func getTwoThings(first: String) ->(String) -> String {
            return {
                (second: String) -> String in
                return "\(first) \(second)"
            }
        }
        let gotFirstStillNeedSecond = getTwoThings(first: "A") //(String) -> String
        let gotSecond = gotFirstStillNeedSecond("B")

# Tail Recursion  
          
          //normal recursion
          func ifactorial (n: Int) -> Int {
              if n == 0 || n == 1 {
                  return 1
              }else {
                  return n * factorial (n: n-1)
              }
          }

          print(ifactorial(n:3))
          ifactorial(n:3)
          3 * ifactorial(n:2)
          2 * ifactorial(n:1)  with substitution  2 * 1
        
          
          //tail
          func factorial (n: Int, currentFactorial: Int = 1) -> Int {
              if n == 0 {
                  return currentFactorial
              }else {
                  return factorial (n: n - 1, currentFactorial: currentFactorial * n)
              }
          }

          print(factorial(n:3))
          
          factorial(n: 3, currentFactorial: 1)
          factorial(n: 2, currentFactorial: 1 * 3)   // n = 3
          factorial(n: 1, currentFactorial: 3 * 2)   // n = 2
          factorial(n: 0, currentFactorial: 6 * 1) -> n = 0 => currentFactorial = 6
    
        
        
# Baisc Recursion 

I hate one-liners, is like you figure out a useless trick that makes no god damn difference to the complier 


                    func factorial (n: Int) -> Int {
                              return (n == 0 || n == 1) ? 1 : n * factorial (n: n - 1)
                    }
                    
          notes:
          let y = false
          let x = y ? 1 : 2 => 2
          
                    func ifactorial (n: Int) -> Int {
                     if n == 0 || n == 1 {
                              return 1
                    }else {
                              return n * factorial (n: n-1)
                    }
                    }
                    
           the understand recursion the simpliest way to write it out on paper
           than you can quickly see the pattern of reduction and be able to come up with someone that works
           with help of unit testing
                    
                    //2^3 = 2^2 * 2 = 2^1 * 2 * 2
                    //n^1 = 2 * n^ (0) = 2 * 1
                    //my creationg
                    func powerOfTwo(n: Int) -> Int{

                        if n == 0 {
                            return 1
                        } else{
                            return 2 * powerOfTwo(n: n - 1)
                        }
                    }
                    powerOfTwo(n: 3)
                    //book's creation
                    func powerOfTwoBook(n: Int) -> Int{
                        return n == 0 ? 1 : 2 * powerOfTwo(n: n - 1)
                    }
                    powerOfTwoBook(n:3)

          non-recusive
          func power2(n: Int) -> {
                    var y = 1 
                    for _ in 0...n-1 {
                     y *= 2
                     }
                     return y
          
          }
          
          again recursion is a cool trick but IS more confusing, plus your calling functions over and over
          so what does somes compilers do ? cover it to loop
          
          func repeatStuff(str: String, n: Int) -> String {
    

              return n == 0 ? "" : str + repeatStuff(str: str, n: n-1)
          }

          print(repeatStuff(str: "x", n: 5))

          func repeatStuff2(str: String, n: Int) -> String {

              var newStr = ""
              for _ in 1...n {
                  newStr += str
              }
              return newStr
          }

          print(repeatStuff(str: "y", n: 5))
          
          
          
