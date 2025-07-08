//
//  Global.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/9/25.
//

import Foundation

class Global {
    
    
    init() {}
    
    func entityNameString() -> String {
        return "SubscriberEntity"
    }
    
    func mockURLString() -> String {
        return "https://my.api.mockaroo.com/globeapi.json?key=ff232470"
    }
    
}


enum KeyIdName: String, CaseIterable {
    
    case id = "id"
    case firstName = "firstName"
    case lastName = "lastName"
    case gender = "gender"
    case email = "email"
    case address = "address"
    case phoneNumber = "phoneNumber"
    case isPostpaid = "isPostpaid"
    case photoUrl = "photoUrl"
    
    var displayName: String {
        return self.rawValue
    }
}
