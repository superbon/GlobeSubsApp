//
//  FetchSubscribersUseCaseTests.swift
//  GlobeSubsAppTests
//
//  Created by Bon Ryan on 7/8/25.
//

import Testing
import XCTest
@testable import GlobeSubsApp

final class FetchSubscribersUseCaseTests: XCTestCase {
    func testReturnsRemoteData() async {
        let mockRepo = MockSubscriberRepository()
        let useCase = FetchSubscribersUseCase(repository: mockRepo)
        let result = await useCase.execute()
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.firstName, "Test")
    }
}

final class MockSubscriberRepository: SubscriberRepository {
    func getSubscribers() async throws -> [Subscriber] {
        [Subscriber(id: 2, firstName: "Bon Ryan", lastName: "Beneojan", gender: "male", email: "bonryan@gmail.com", address: "Makati", phoneNumber: "09171234567", isPostpaid: false, photoUrl: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d")]
    }
}
