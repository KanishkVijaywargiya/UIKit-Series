let myOptional: String?

//myOptional = "Kanishk"
myOptional = nil

// this will not work as text expect String & myOption expect String?
//let text: String = myOptional

// so how we can do an unwrapping of an optional string, there are 5 ways :-

// 1]. Force Unwrapping
//============================
// if there is no value or nil value then force unwrap will cause a run time crash.
//let text: String = myOptional!


// 2]. Check for nil value :-
//============================
// here after checking also, we need to force unwrap every single time
if myOptional != nil {
    let text: String = myOptional!
    let text2: String = myOptional!
    print("\(text) + \(text2)")
} else {
    print("my optional found to be nil")
}


// 3]. Optional Binding :-
//============================
if let safeOptional = myOptional {
    let text: String = safeOptional
    print("Safe optional :- \(text)")
} else {
    print("my optional found to be nil")
}


// 4]. Nil Coalescing Operator :-
//=================================
let text: String = myOptional ?? "Angella"
print("Nil Coalescing operator :- \(text)")


// 5]. Optional Chaining :-
//============================
//struct in place of direct values
struct MyOptional {
    var property = 123
    func method() {
        print("I'm a struct's method")
    }
}
//assigining the struct as a datatype of variable instead of string n all
let myOptional2: MyOptional?

//instead of directly assigning the values, we will assign the struct to initializing the struct, just instead of one value
myOptional2 = MyOptional()
//myOptional2 = nil

print(myOptional2?.property)
print(myOptional2?.method())


