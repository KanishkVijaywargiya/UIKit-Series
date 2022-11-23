//Computed properties

import Foundation

//---------------------------- Pizza Calculator -----------------
let pizzaInInches: Int = 12
var numberOfPeople: Int = 6
let slicesPerPerson: Int = 5

var numberOfSlices: Int {
    return pizzaInInches - 4
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}
numberOfPizza = 6
print(numberOfPizza)


//---------------------------- Tutorial -------------------------
//stored properties
//let pizzaInInches: Int = 12
//var numberOfSlices: Int = 10

//computed property
//var numberOfSlices: Int {
//    return pizzaInInches - 4
//} //getter

//computed property
//var numberOfSlices: Int {
//    get {
//        return pizzaInInches - 4
//    } //getter
//    set {
//        print("number of slices now has a new value which is \(newValue)")
//    } //setter
//}

//numberOfSlices = 12

//print(numberOfSlices)


//let a = numberOfSlices * 2

//func calcPizzaSlices() {
//    numberOfSlices = pizzaInInches - 4
//}
//calcPizzaSlices()
//print(numberOfSlices)


// MARK:
// always prefer to use computed properties, when there is no parameters or return type involved in a function/method.



