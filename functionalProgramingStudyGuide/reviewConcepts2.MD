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


 basically we have two function
 
 f,g
 and we want to make it to a composed function
  h(x) = g(f(x))

                   let twoInOneFunction = { x in
                            formatNumWithDollarSign(content: seperateElements(x))
                    }

                    twoInOneFunction(content)

//side note: this kind of remind me of

                        var label: UILabel = { x in
                        let l = UILabel()
                        l.text = x
                         return l
                        }("something")
                        
                        
                        
#  Make this easier to understand 

                let h = { x in print(x+1)  }
                
  this means we can do h( )  <--- and pass stuff into the funciton and let it do stuff
                h(2)
                
                "3"
                
                
 pretty simple stuff if you gave them x,y,z symbols instead of functional names that is confusing



#  Custom Operators

                infix operator |>

                func |> <T, V>(f: @escaping (T) -> V, g: @escaping (V) -> V ) -> (T) -> V {
                    return { x in g(f(x)) }
                }
                
 #  Using the customer Operator
 
                       func f(_ content: String) -> [String] {
                            let array:[String] = content.characters.split(separator: ",").map { String($0)}

                            return array
                       }
           
                        func g(content: [String]) -> [String] {
                            return content.map {"$\($0)"}
                        }
                
                
                let h = f|> g
                h("10,20,40,30,80,60")


rewrote this in another way

                        let f: (String) -> [String] = { x in content.characters.split(separator: ",").map{ String($0)}
                        }

                        let g: ([String]) -> [String] = { x in x.map{"$\($0)"} }

                        let h = f |> g
                        h("10,20,40,30,80,60")
                        
using type inferance 

                        let f = { (x: String) in x.characters.split(separator: ",").map{ String($0)}}
                        let g =  { (x: [String]) in x.map{"$\($0)"}}

                        let h =  f |> g
                        
                        
                        
or just pass in the closure

                        let h = {(x:String) in x.characters.split(separator: ",").map{ String($0)}} |> 
                                 { (x: [String]) in x.map{"$\($0)"}}
                                 
                         h("10,20,40,30,80,60")
                         
                         
 # after some experiment 
 
 
                                let f = { (x: String) in x.characters.split(separator: ",").map{ String($0)}}
                                let g =  { (x: [String]) in x.map{"$\($0)"}}

                                let b = g(f("23,24"))
                                
                                
                              
                         
 Well...this sure is better than the stupid  infix operator |>

