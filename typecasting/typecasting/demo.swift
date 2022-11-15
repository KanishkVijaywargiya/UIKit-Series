// Closely related to TypeCasting
// Any, AnyObject, NSObject

// Any - All Objects
// AnyObject - Objects derived from Class
// NSObject - Foundation Objects, (NSString, NSNumber, NSData, NSDate, JSONSerialization, DateFormatter, FileManager)

import Foundation

class Animal2 {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class Human2: Animal2 {
    func code() {
        print("Typing away...")
    }
}

class Fish2: Animal2 {
    func breathUnderWater() {
        print("Breathing under water.")
    }
}

let kanishk2 = Human2(n: "Kanishk Vijaywargiya")
let manas2 = Human2(n: "Manas Vijaywargiya")
let nemo2 = Fish2(n: "Nemo")

let num = 12
// we can only add int data type variable to a array [Animal] data type is by using [Any]
let neighbours2: [Any] = [kanishk2, manas2, nemo2, num]

//throws error, // AnyObject - Objects derived from Class
//let neighbours3: [AnyObject] = [kanishk2, manas2, nemo2, num]

struct NewFish {
    func breathUnderWater() {
        print("Breathing under water.")
    }
}
let newNemo = NewFish()

//throws error, // AnyObject - Objects derived from Class
//let neighbours4: [AnyObject] = [kanishk2, manas2, newNemo]

let num1: NSNumber = 12
let word: NSString = "ABC"
let neighbours5: [NSObject] = [num1, word]

// NSObject - Foundation Objects, (NSString, NSNumber, NSData, NSDate, JSONSerialization, DateFormatter, FileManager)
//let neighbours6: [AnyObject] = [kanishk2, manas2, newNemo]

