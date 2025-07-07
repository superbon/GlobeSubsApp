//
//  SubscriberEntity.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation


// check if SwiftData is available. iOS17+
#if canImport(SwiftData)
import SwiftData

// Core Model
@Model
final class SwiftDataSubscriberEntity {
    @Attribute(.unique) var id: Int
    var firstName: String
    var lastName: String
    var gender: String
    var email: String
    var address: String
    var phoneNumber: String
    var isPostpaid: Bool
    var photoUrl: String

    init(id: Int, firstName: String, lastName: String, gender: String, email: String, address: String, phoneNumber: String, isPostpaid: Bool, photoUrl: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = lastName
        self.email = lastName
        self.address = address
        self.phoneNumber = phoneNumber
        self.isPostpaid = isPostpaid
        self.photoUrl = photoUrl
    }
}
#endif
