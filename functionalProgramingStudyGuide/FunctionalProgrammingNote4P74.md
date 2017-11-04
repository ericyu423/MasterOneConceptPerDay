# Referenece  type copy


        class Manager: NSObject, NSCopying {

            func copy(with zone: NSZone? = nil) -> Any {
                let copy = Manager(firstName: firstName, lastName: lastName, age: age)
                return copy
            }

            var firstName: String
            var lastName: String
            var age: Int

            init(firstName: String, lastName: String, age: Int) {
                self.firstName = firstName
                self.lastName = lastName
                self.age = age
            }

            func copy(width: NSZone? = nil) ->Any{
                let copy = Manager(firstName: firstName, lastName: lastName, age: age)
                return copy
            }
        }

        let john = Manager(firstName: "John", lastName: "Doe", age: 35)


        let jane = john.copy() as! Manager
        jane.firstName = "Jane"
        jane.lastName = "Doe"
        jane.age = 40


        print("\(john.firstName) \(john.lastName) \(john.age)")//John Doe 35
        print("\(jane.firstName) \(jane.lastName) \(jane.age)")//Jane Doe 40
