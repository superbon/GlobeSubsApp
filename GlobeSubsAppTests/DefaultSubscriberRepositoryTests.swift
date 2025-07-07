//
//  DefaultSubscriberRepositoryTests.swift
//  GlobeSubsAppTests
//
//  Created by Bon Ryan on 7/8/25.
//

import Testing
import XCTest
@testable import GlobeSubsApp
import SwiftData

final class DefaultSubscriberRepositoryTests: XCTestCase {
    func testFallsBackToLocalOnRemoteFailure() async {
        let remote = FailingRemoteDataSource()
        let local = await InMemoryLocalDataSource()
        await local.save([
            Subscriber(id: 2, firstName: "Local", lastName: "Only", gender: "male", email: "bonryan@gmail.com", address: "Makati", phoneNumber: "09991234567", isPostpaid: false, photoUrl: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d")
        ])
        let repo = DefaultSubscriberRepository(remote: remote, local: local)
        let result = try? await repo.getSubscribers()
        XCTAssertEqual(result?.first?.firstName, "Local")
    }
}

final class FailingRemoteDataSource: RemoteSubscriberDataSource {
    override func fetchSubscribers() async throws -> [Subscriber] {
        throw URLError(.notConnectedToInternet)
    }
}

final class InMemoryLocalDataSource: LocalSubscriberDataSource {
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: SwiftDataSubscriberEntity.self, configurations: config)
        let context = ModelContext(container)
        super.init(context: context)
    }

    private var store: [Subscriber] = []

    override func save(_ list: [Subscriber]) {
        store = list
    }

    override func load() -> [Subscriber] {
        store
    }

    override func clear() {
        store = []
    }
}

