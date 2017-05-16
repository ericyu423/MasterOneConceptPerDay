# functionalProgramingStudyReviewGuide

reference: Going through the book 
'Swift 3 Functional Programming'

Start Date: May 6, 2017

Imperative example - uses statements that change a program's state.
*I understand it as, you see it exactly what is going on*

      let array = [2, 3, 5, 7]

      var doubleArrayValue:[Int] = []
      
         for e in array {
             doubleArrayValue.append(e * 2)
       }
       
      // doubleArrayValue = [4,6,10,14]


Declarative example - expresses the logic of a computation without describing its control flow
*I understand it as, tellling the function what you want to do and it will do it*
*for this example take each element ($0) and mutiple by 2 and give me a result*

"map" is used quite often in swift

      let array = [2, 3, 5, 7]

      let doubleArrayValue = array.map({ i in 2 * i }) 
      let doubleArrayValue = array.map({ $0 * 2 })
      
      ->[4,6,10,14]


Some features:

      let firstNumber = oneToFour.lazy.map({ $0 * 2}).first       | 4
      let firstNumber = oneToFour.lazy.map({ $0 * 2}).last        | 14


*conclusion:  declarative method looks a tiny bit easier to do unit test


          struct MyArray {
              var arry: [String] = []
              mutating func getArray(arryIn: [String]){
                  self.arry = arryIn
              }
          }

          var myArray = MyArray()

          myArray.getArray(arryIn: ["1","2","3"])

          print(myArray.arry)
        
result -> ["1","2","3"]

# Fun with Swift Console Error REMEBER TO SCROLL UP
    
* 
*  "mutating" keyword is need to function that changes a struct variable (not needed in class)
*   but is a good way to learn to read error messages as shown below

          Playground execution failed: error: MyPlayground.playground:10:19: error: cannot assign to property: 'self' is immutable
                  self.arry = arryIn
                  ~~~~      ^

          MyPlayground.playground:9:6: note: mark method 'mutating' to make 'self' mutable
               func getArray(arryIn: [String]){
               ^
               mutating 
             
*  scroll up your error output is actually very very helpful


*   what if you omit (self) in self.arry = arry

        struct MyArray {
            var arry: [String] = []
            mutating func getArray(arry: [String]){
                arry = arry
            }
        }

        var myArray = MyArray()

        myArray.getArray(arry: ["1","2","3"])

        print(myArray.arry)


        ****console error*****
        Playground execution failed: error: MyPlayground.playground:10:14: error: cannot assign to value: 'arry' is a 'let' constant
          arry = arry
          ~~~~ ^

*this error is not that helpful for beginners


* on previous example if you change var myArray to let myArray and try myArray.getArray

        *****console error******
        Playground execution failed: error: MyPlayground.playground:16:1: error: cannot use mutating member on immutable value: 'myArray' is a 'let' constant
        myArray.getArray(arry: ["1","2","3"])
        ^~~~~~~

        MyPlayground.playground:14:1: note: change 'let' to 'var' to make it mutable
        let myArray = MyArray()
        ^~~


# First-class functions
                        
 *basically mean you can pass it to another function much like g(f(x))
 
# Higher-order functions
 
 ...why can't they just say certain function can take in functions as a parameter....
  example map, filter, and reduce
  
  g(f(x)) g is the "higher" order function i guess....
  
  
#  Example
  
  
          func square(a:Double) -> Double {
              return a * a
          }

          func cube(a:Double) -> Double {
              return a * a * a
          }

          func averageOfFunction(a:Double,b:Double,f:((Double) -> Double)) -> Double {
              return (f(a) + f(b)) / 2
          }

so the "higher-order function" averageOfFuncions took in 2 numbers. It also take a function that teaches the 
higher-order function what to do. 

          averageOfFunction(a: 3,b: 4,f: square)
          
Look at it this way might be easier:
  suppose we have function f and g
        
        f(x) = x * x
        
       define  g(a,b) = f(a) + f(b)
       
       so g(3,4) = f(3) + f(4)  
          g(3,4) = 9 + 16
          g(3,4) = 25

another way to do it without define a function outside

        averageOfFunction(a: 3,
                          b: 4,
                          f:
                              {
                                  (x: Double) -> Double in
                                      return x * x
                              }
                          )
                          
 clearer view of what is going on.


1. averageOfFunction does  (f(a) + f(b)) / 2
 
2. f(x) is define by a function..normally it should look like

      f:  { myFunc(x: Double) -> Double {
            return x * x
          } }

because we don't need the name of the function...it get simplifed to

       f: {(x: Double) -> Double {
          return x * x
        }}
        
*For easy view-ability it evolve to (in replace the {} we already have a closing bracket, so sure two of them *
*is more confusing than just seeing one.*

       f: {(x: Double) -> Double in
          return x * x
        }

*There is a magic default variable in one of these function $0 so we can further simply it*
*we know we take in one value each time, and is going to do something to that value*
*so we can just wrote the following*

        {
              $0*$0
        }
         
        averageOfFunction(a: 3,b: 4){$0*$0}
        
*it actually logically evolve to this if you really think about it mathematically. It makes a lot of sense.*

     
  
      


# Filter, Map, Reduce

once you understand g(f(x)) it became very clear

filter 
you get to pass in a function and change each element of your array
      
      
      var array = [1,2,3,4,5,6]

      let me = array.map { (x) -> String in
             return "\(x + 1)"
       }
       
       ["2", "3", "4", "5", "6", "7"]
       
or doing something weird
      
      let me = array.map { (x) -> String in
      if x == 1 {
            return "CCC"
      }
      return "\(x + 1)"
      }

      print(me)
      
      ["CCC", "3", "4", "5", "6", "7"]


            
# Filter

basically you make your array shorter by throwing out stuff

       var array = [1,2,3,4,5,6]

        let me = array.filter { (x) -> Bool in
                  return x > 3
         }
         
         
-> Bool basically says...if condition is false i will throw the elemnent away
         
so from the understanding of closures we can see this can be written as something less compicated


        var array = [1,2,3,4,5,6]

        let me = array.filter { x > 3 }  //which is wrong, kinda obvious given our orignal function was (x) -> Bool
         }
         
         let me = array.filter { $0 > 3}
         


        
# Reduce (This one is slighly more complicated)

first let's take a look
            
            var sum = array.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws ->      
            Result##(Result, Int) throws -> Result#>)
            
initialResult: starting value
(Result,Int): sum, element

                  var array = [1,2,3,4,5,6,7,8,9,10]



                  var sum = array.reduce(0) { (result, item) -> Int in

                      return item + result
                  }
            
sum = 55

                  var sum = array.reduce(0) { (result, item) -> Int in
                      if item < 5 {
                          return item + result
                      }

                      return result
                  }


                  print(sum)
                  
add all item that are less than 5                  
sum = 1+2+3+4

                  var array = [2,2,3,3,4,4,]
                  
                  var sum = array.reduce(0) { (result, item) -> Int in
                   if item < 3 {
                           return item + result
                   }
                          
                        return result
                    }

add all item that are less 3
print(sum)



            var array = [1,2,3,4,5,6,]



            var sum = array.reduce(0) { (result, item) -> Int in
    
             print(result,item)
            return item + result

            }
            
            
            :::console:::
                  0 1
                  1 2
                  3 3
                  6 4
                  10 5
                  15 6
                  21



you can ignore the elements

            var array = [1,2,3,4,5,6,]



            var sum = array.reduce(0) { (result, item) -> Int in

                    return result + 1

            }


            print(sum) -> 6

       

      
# flatmap, join array and get rid of nils

                  let arrayO: [Int?] = [1,nil, nil,4, nil, nil,nil,10]

                  let array = arrayO.flatMap { $0 }

                  print(array)
                  
  --> [ 1 ,4 ,10]
  
  
Joining array

      let array = [[1,2,3],[3,4,5]]
      let narray = array.flapmap{$0}
      
      
      
*what does it really doing ?

      
            let array = [[5,2,7],[4,8],[9,1,3]]
            let result = array.flatMap { (whatever) in
                print(whatever)
            }
 
            output --->
             [5, 2, 7]
              [4, 8]
             [9, 1, 3]
             
so if we want to combine the arrays let's write out the whole code to have a better understanding

              let array = [[5,2,7],[4,8],[9,1,3]]
              let result = array.flatMap { (whatever) in
                   whatever.map({ (x) in
                        return x
                  })

            }
            print(result)
            
            
so flapmap reads one array at a time , than you give it to map, that reads one element at a time

[[]] --> []  --> individual elements
            
            
 
            
            
#  ?? Nil coalescing operator 

some interesting things tested on playground


let z = optional ?? non-optional -> z is non-optional , first optional get unwarped

let z = nil ?? nil   --> z is nil

let z = 3 ?? optional  --> z is optional 3

in normal usage 
if first element is nil than use the value on the right side instead

z = nil ?? 4   z = 4


# stride 

let me1 = Array(stride(from: 3, to: 1, by: -1))
let me2 = Array(stride(from: 1, to: 3, by: 1))
let me3 = Array(stride(from: 1, through: 3, by: 1))

[3,2]
[1,2]
[1,2,3]

         
            for index in stride(from: 0, to: 3, by: 2){
                print(index)
            }  ---> 0 , 2
            
            
            
# variadic parameters: 

            func sumOf(numbers:Int...) -> (Int, Int) {
                   var sum = 0
                   var counter = 0
                   for number in numbers {
                        sum += number
                        counter += 1
                     }
                   return (sum, counter)
               }
               
               
                     func sum(numbers:Int...) -> (Int, Int) {
                         var sum = 0
                        var counter = 0
                        for number in numbers {
                         sum += number
                              counter += 1 }
                         return (sum, counter)
                      }

      sum(numbers: 1,2,3,4,5,6,7,8,9,10)
      
      
sorta look act like reduce

                   var array = [1,2,3,4,5,6,7,8,9,10]



                  var sum = array.reduce(0) { (result, item) -> Int in

                      return item + result
                  }


# Some Stuff I havn't found the right place to used them yet 

# Nested Function 

       func returnTen() -> Int {
             var y = 5
             func add() {
                 y += 5
             }
             add()
             return y
         }
         returnTen()
     
# Fun with closures

           func makeIncrementer() -> (Int) -> Int {
                func addOne(number: Int) -> Int {
                    return 1 + number
                }
                return addOne
            }
            var increment = makeIncrementer()


            increment(7)
            
            
            
breaks it down to get a better understanding breaking down the code in playground
you can see you are just passing a closure. the below does the same thing

            var test = {(number: Int) in
                              return 1 + number
                        }
         
option click on incremenet:   var increment: (Int) -> Int 
option click on incremenet    var test: (Int) -> Int


test(7) == increment(7)

you can simplified it

                  var test = {  return 1 + $0  }
                  
                  
                  
                  
you can simplifed the first one too

                  func makeIncrementer() -> (Int) -> Int {
                      return { (number: Int) -> Int in
                           1 + number
                      }
                  }
                  
                  //and
                  
                  func makeIncrementer() -> (Int) -> Int {
                          return { (number) -> Int in
                                1 + number
                             }
    
                   }
                   
                   //and 
                   
                   
                   func makeIncrementer() -> (Int) -> Int {
                          return { (number) in
                              1 + number
                           }
    
                   }
                   
                   //and
                   
                   func makeIncrementer() -> (Int) -> Int {
                              return {
                                     1 + $0
                               }
                   }
                   
 * Conclusion: if you don't know how to write a closure start with a regular function
 * and start simplifying
 
 
 # Generics - Very useful
 
 
 swap stuff - 
 
 
   func swapStuff( x: inout Int, y: inout Int) {
                  let temp = a
                    x = y
                  y = temp 
    }
    
    making it getneric by using a T infront

              func swapStuff<T>(_ x: inout T, _ y: inout T) {
                let temp = x
                x = y
                y = temp
              }

                  var a = "me"
                  var b = "you"

            swapStuff(&a,&b)
            
            
# Class: To find out if two constants or variables refer to the same instance of a class use  ===   !==


#Subscript:  They act sort of like a function.

                        struct TimesTable {
                               let multiplier: Int

                               subscript(index: Int) -> Int {
                                     return multiplier * index
                                }
                  
                              func test(index: Int) -> Int {
                                      return multiplier * index
                               }

                         }

                        let fiveTimesTable = TimesTable(multiplier: 5)


                  fiveTimesTable[6]
                  fiveTimesTable.test(index: 6)
                  
 they give you the samething
 
 
 
 Protocol:
 
 
            protocol ExampleProtocol {
                var simpleDescription: String { get }
                mutating func adjust()
            }

            class SimpleClass: ExampleProtocol {
                var simpleDescription: String = "class"
                func adjust() {
                    simpleDescription += " end"
                }
            }

                var aSimpleClass = SimpleClass()
                    aSimpleClass.adjust()
               let aDescription = aSimpleClass.simpleDescription


            struct SimpleStructure: ExampleProtocol {
                var simpleDescription: String = "struct"

                mutating func adjust() {
                    simpleDescription += " end"
                }
            }
                var aSimpleStruct = SimpleStructure()
                    aSimpleStruct.adjust()
                let aSimpleStructDescription = aSimpleStruct.simpleDescription
                
                
                
How I think of it after using it for few years: 
    to remind yourself all the functions you need to write, so you don't miss any functions that you need to impliment
    For example it is pretty helpful when you are trying to pass conext between controllers, you make sure each   
    viewcontroller, down
    the chain implement a receive function i receive the context





#  Functions:  Functional Programming

* program in C there are no classes all functions


*Public access:  Any entity can access a method that is defined as public if it is in the same module
          if you are trying to develope a frame work you want other modules to use it
          
*Internal access:  default, use it within module

*Private access:   only within same source file


# Methods come in 3 forms



*Instance methods
      create an instance to use it  let me = Me()  me.somefunction

*Static methods
      use it without creating an instance Me().somefunction

*Class methods
      can be overridden by subclasses
      
      
# Best practices in function definition: point copy straight out from the book

*Try not to exceed 8-10 lines of code in each function as shorter functions or methods are easier to read, understand, and maintain.

*Keep the number of parameters minimal because the more parameters a function has, the more complex it is.

*Functions should have at least one parameter and one return value.

*Avoid using type names in function names as it is going to be redundant.

*Aim for one and only one functionality in a function.

*Name a function or method in a way that describes its functionality properly and is easy to understand.

*Name functions and methods consistently. If we have a connect function, we can have a disconnect one.

# Write functions to solve the current problem and generalize it when needed. Try to avoid what-if scenarios as probably you aren't gonna need it (YAGNI).


so is all very intuitive other than the last one

# What-if... I always get this one confused with "reusability"

yea...don't want to get into it but highly recommand that do anything to avoid

WHAT-IF if what-if happens than go change your dman code, for functions it only take few mins.
don't waste time thinkin about what-ifs



# Do - Catch and Delegate Pattern

            protocol HttpProtocol{
                func didRecieveResults(results: NSDictionary)
            }

            struct WebServiceManager {

                var delegate:HttpProtocol?
                let data: Data

                func test() {
                    do {
                        let results: NSDictionary = try
                            JSONSerialization.jsonObject(with: self.data, options: 
                            JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        
                        self.delegate?.didRecieveResults(results: results)

                    } catch let error as NSError {

                        print("json error" + error.localizedDescription)

                    }
                }
            }
             /********** do catch **********/           
      
            do{
                  let result = try something
               }catch let error as NSError {
                    //print error or do something about the error
               }  
               
               
 I really like this Delegate pattern
 
                
            self.delegate?.didRecieveResults(results: results)
            
            
            think of delegate is a piece of incomplete object that spans
            from class A -----  class B
            
                                                          class B: MyProtocol
             var delegate: MyProtocol                      var a = A()  //instance of a
                                                                 
             delegate.getSomething(something) <--------->     a.delegate = self     ///Information connected
                                                               fun getSomething( ){   //this is the "decoder"
                                                                  get the stuff 
                                                               }
            
            
            whoever want this result information they are to do that following
            
            1. create an instance of the class that holds the "delegate"...kinda obvious how else can you access it
            2. anInstance.delegate = self ....this links the information from the sourceOfinformation to receivingParty
            3. protocol is a dictator that force you to create things inside it
            4. you are force to create
                        func didReceiveResults(results: result)
                        {
                                    //whenever self.delegate?.didRecieveResults(results: results) is called
                                    // you are force to receive reult in this function                        
                        }
            
            
            
            
                  
 
 
