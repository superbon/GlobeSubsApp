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
public struct Subscriber: Identifiable, Codable, Equatable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let gender: String
    public let email: String
    public let address: String
    public let phoneNumber: String
    public let isPostpaid: Bool
    public let photoUrl: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
