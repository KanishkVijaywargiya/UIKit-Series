//------------------------
// as as? as! is
//------------------------

import Foundation

class Animal {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class Human: Animal {
    func code() {
        print("Typing away...")
    }
}

class Fish: Animal {
    func breathUnderWater() {
        print("Breathing under water.")
    }
}

let kanishk = Human(n: "Kanishk Vijaywargiya")
let manas = Human(n: "Manas Vijaywargiya")
let nemo = Fish(n: "Nemo")

let neighbours = [kanishk, manas, nemo]

let neighbours1 = neighbours[0]

//if neighbours[0] is Human {
//    print("First neighbour is human")
//} else {
//    print("Not a human")
//}

func findNemo(from animals: [Animal]) {
    animals.forEach { animal in
        //print(animal.name)
        if animal is Fish {
            print("⚠️\(animal.name) found")
            //animal.breathUnderWater()//we cannot use this func as it is still Animal datatype & Animal calss don't have that functionalities.
            
            // ⚠️ FORCED Downcasting ⚠️ to one of it's sub class let's say Fish
            let fish = animal as! Fish //datatype is Fish class
            fish.breathUnderWater()
            
            let animalFish = fish as Animal // ⚠️ Upcast ⚠️
            
        }
    }
}
findNemo(from: neighbours)


// ⚠️PROBLEM with Forced Downcast i.e. ⚠️ as! ⚠️
//let fish = neighbours[1] as! Fish
//fish.breathUnderWater()
// explanation: Could not cast value of type 'typecasting.Human' ⚠️ RUN TIME ERROR ⚠️

//as? converts fish into optional
let fish = neighbours[1] as? Fish
fish?.breathUnderWater() //this ? here means optional Chainning
//----
if let fish2 = neighbours[1] as? Fish {
    fish2.breathUnderWater()
} else {
    print("Casting has failed")
}



// MARK: NOTES
// is Keyword is used for typechecking
// we have used ** is ** as we are confident as it has a datatype of Fish only.

// as Keyword is used to convert back to particular type. Used to raise a object to its super classes types.
//⚠️ Upcast ⚠️

// as? Keyword is used for when we are not sure, ⚠️safer way⚠️ to perform a down casting.
// as! Keyword is used for FORCED Downcasting, ⚠️dangerous⚠️.

// this is not really a typecasting
let myDouble = 0.0
let myDoubleAsInt = Int(myDouble)
