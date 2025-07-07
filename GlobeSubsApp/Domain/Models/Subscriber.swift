//
//  Subscriber.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation

// Identifiable for list, Foreach and  onject uniquely
// Codable for JSON API conversion
// Equatable Equality checks, testing and object comparison
struct Subscriber: Identifiable, Codable, Equatable {
    let id: Int
    let firstName: String
    let lastName: String
    let address: String
    let phoneNumber: String
    let isPostpaid: Bool
    let photoUrl: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
