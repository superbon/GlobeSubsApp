//
//  MockSubscribers.swift
//  GlobeSubsAppTests
//
//  Created by Bon Ryan on 7/8/25.
//

import Foundation
import GlobeSubsApp

class DefaultSubscriberRepository {
    func getSubscribers() async throws -> [Subscriber] {
        return [] // Stub
    }
}

final class MockSubscriberRepository: DefaultSubscriberRepository {
    var mockSubscribers: [Subscriber] = []
    var shouldThrowError = false

    override func getSubscribers() async throws -> [Subscriber] {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        return mockSubscribers
    }
}
