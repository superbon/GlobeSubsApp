//
//  GlobeSubsAppTests.swift
//  GlobeSubsAppTests
//
//  Created by Bon Ryan on 7/5/25.
//

import Testing

@testable import GlobeSubsApp
import Foundation

struct GlobeSubsAppTests {

    @Test func testSuccessfulLoad() async throws {
        let mockRepo = MockSubscriberRepository()
        mockRepo.mockSubscribers = [
            Subscriber(id: 1, firstName: "Ana", lastName: "Santos", gender: "male", email: "bonryan@gmail.com", address: "Makati", phoneNumber: "+63 905 663 4188", isPostpaid: true, photoUrl: "https://plus.unsplash.com/premium_photo-1708271135038-35e776cce861")
        ]

        let viewModel = SubscriberListViewModel(repository: mockRepo)
        await viewModel.load()

        #expect(viewModel.subscribers.count == 1)
        #expect(viewModel.subscribers.first?.firstName == "Ana")
    }

    @Test func testFailureLoad() async throws {
        let mockRepo = MockSubscriberRepository()
        mockRepo.shouldThrowError = true

        let viewModel = SubscriberListViewModel(repository: mockRepo)
        await viewModel.load()

        #expect(viewModel.subscribers.isEmpty)
    }
}
