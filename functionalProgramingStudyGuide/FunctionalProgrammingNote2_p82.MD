# Memorization


                    //struct Dictionary<Key, Value> : Collection, ExpressibleByDictionaryLiteral where Key : Hashable

                    //var memo = Dictioanry<Int, Int>()

                    var memo = Dictionary<Int,Int>()

                    func memoizedPower2(n: Int) ->Int {
                        if let memoizedResult = memo[n]
                        {
                            return memoizedResult
                        }
                        var y = 1
                        for _ in 0...n-1 {
                            y *= 2
                        }
                        memo[n] = y
                        return y
                    }

                    print(memoizedPower2(n: 2))
                    print(memoizedPower2(n: 3))
                    print(memoizedPower2(n: 4))
                    print(memo)

                    /*
                     4
                     8
                     16
                     [2: 4, 3: 8, 4: 16]
                    */





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
          
          
 # Memoization function (come back to this later)
                     func memoize<T: Hashable, U>( fn: @escaping ((T) -> U, T) -> U) -> (T) -> U {

                            var memo = Dictionary<T,U>()
                            var result: ( (T) -> U )!
                            result = { x in
                                if let q = memo[x] {
                                    return q
                                }

                                let r = fn(result, x)

                                memo[x] = r

                                return r
                            }
                            return result
                    }

                    let factorial = memoize { (factorial ,x) in

                       return x == 0 ? 1 : x * factorial (x-1)

                    }

                    let powerOf2 = memoize { (pow2, x) in
                        return x == 0 ? 1 : 2 * pow2(x - 1)
                    }

                    print(factorial (5))
                    print(powerOf2(5))




                    //function fn is (   (T)->U   ,    T  )   ->  U
                    //example fn((Int)->Double, Int)->Double


                    /*
                     T: Hashable meaning T can be use as a key

                     Hashing is a concept in computer science which is used to create high performance, pseudo random access data structures where large amount of data is to be stored and accessed quickly.

                     For example, if you have 10,000 phone numbers, and you want to store them in an array (which is a sequential data structure that stores data in contiguous memory locations, and provides random access), but you might not have the required amount of contiguous memory locations.

                     So, you can instead use an array of size 100, and use a hash function to map a set of values to same indices, and these values can be stored in a linked list. This provides a performance similar to an array.

                     Now, a hash function can be as simple as dividing the number with the size of the array and taking the remainder as the index.
                     */



          
          
          
