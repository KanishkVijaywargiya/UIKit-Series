import UIKit

let myOptional: String?

//myOptional = "Kanishk"
myOptional = ""

// this will not work as text expect String & myOption expect String?
//let text: String = myOptional

// so how we can do an unwrapping of an optional string

// there r 5 ways

// 1]. Force Unwrapping
let text: String = myOptional!

// 2]. Check for nil value :-

// 3]. Optional Binding :-

// 4]. Nil Coalescing Operator :-

// 5]. Optional Chaining :-
