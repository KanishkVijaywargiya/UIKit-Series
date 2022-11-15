//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Kanishk Vijaywargiya on 12/11/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

// we have added static becoz of a reason
// if we don't add static keyword we need to make an object of this struct
/**
 i.e.
 struct Constants {
    let instanceProperty = "ABC"
    static let typeProperty = "123"
 
    func instanceMethod() { .... }
 
    static func typeMethod() { .... }
 }
 let myConst = Constructs()
 print(myConst.instanceProperty)
 
 we need to create an object for instance property & for type property we don't need to.
 
 Instance property are associated with instances that has been created from the type.
 Type property is associated with type
 **/
// If we use static then we don't need to make an object, it can be used as Construct type
