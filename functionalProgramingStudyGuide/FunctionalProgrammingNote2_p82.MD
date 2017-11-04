
#Curried

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
