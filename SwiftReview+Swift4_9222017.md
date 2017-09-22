

# tuple comparison 

(a,b,c) > ( x, y, z)

comparison steps

1. is a > x  if so return true exit, else
2. is b > y  if so return true exit, else 
3. is c > z  if so return true exit. Complete.

errors:
c = true z = false  boolean can not be compared


# Ternary Conditional Operator

question ? answer1 : answer2

is question true or false if true go to answer 1

example 

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
              = 40 + (if hasHeader is true is 50 else use 20)
// rowHeight is equal to 90

# Nil-Coalescing Operator

a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
 
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

defaultColorName should have a default color name. if you put nil xcode 9 gives you a compiler warning.


# Multiline String Literals

var myString = """
   a
   b
   c
   d
"""

prints
    a 
    b
    c
    d
    
var myString = """
   a
      b
   c
   d
   """
   
white space before """ is your margin basically
    
    

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

"\" continue the line (so the sentance won't get too long in xcode where you can't see it)



let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
print (threeDoubleQuotes)

Escaping the first quote """
Escaping all three quotes """


# Initializing an Empty String
var s = ""
var s = string()
// these two are equivalent to each other


# workign with characters

for x in "abcde" {
    print(x)
}

a
b
c
d
e
