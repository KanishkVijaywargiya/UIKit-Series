// Observed Properties

import Foundation

//if there is some unrealistic number then we can use Observed properties.
//eg: pizza in inches is 33, which is not present / invalid size

//observed property
var pizzaInInches: Int = 10 {
    willSet {
        print(pizzaInInches)// old value
        print(newValue)// new value
    } //right before it get change
    didSet {
        print(oldValue)// old value
        print(pizzaInInches)// new value
        
        if pizzaInInches >= 18 {
            print("Invalid size specified, pizzaInInches set to 18.")
            pizzaInInches = 18
        }
    } //right after it get change
}
pizzaInInches = 33
print(pizzaInInches)

var numberOfPeople: Int = 6
let slicesPerPerson: Int = 5
