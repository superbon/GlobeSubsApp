//
//  SwiftDataLocalDataSourceTests.swift
//  GlobeSubsAppTests
//
//  Created by Bon Ryan on 7/8/25.
//

import Testing

#if canImport(SwiftData)
import XCTest
import SwiftData
@testable import GlobeSubsApp

@MainActor
final class SwiftDataLocalDataSourceTests: XCTestCase {
    var modelContext: ModelContext!
    var container: ModelContainer!

    override func setUp() async throws {
        let schema = Schema([SwiftDataSubscriberEntity.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [config])
        modelContext = ModelContext(container)
    }

    func testSaveAndLoad() {
        let dataSource = LocalSubscriberDataSource(context: modelContext)

        let sample = Subscriber(id: 2, firstName: "Local", lastName: "Only", gender: "male", email: "bonryan@gmail.com", address: "Makati", phoneNumber: "09991234567", isPostpaid: false, photoUrl: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d")
        dataSource.save([sample])

        let result = dataSource.load()
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.firstName, "Juan")
    }
}
#endif
