//
//  CoreDataSubscriberDataSourceTests.swift
//  GlobeSubsAppTests
//
//  Created by Bon Ryan on 7/8/25.
//

import Testing

#if !canImport(SwiftData)
import XCTest
import CoreData
@testable import GlobeSubsApp

final class CoreDataSubscriberDataSourceTests: XCTestCase {
    var context: NSManagedObjectContext!

    override func setUp() {
        let container = NSPersistentContainer(name: "GlobeSubsApp")
        let desc = NSPersistentStoreDescription()
        desc.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [desc]
        container.loadPersistentStores { _, error in
            XCTAssertNil(error)
        }
        context = container.viewContext
    }

    func testSaveAndLoad() {
        let dataSource = CoreDataSubscriberDataSource(context: context)

        let sample =  Subscriber(id: 2, firstName: "Local", lastName: "male", gender: "Only", email: "bonryan@gmail.com", address: "Makati", phoneNumber: "09991234567", isPostpaid: false, photoUrl: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d")
        dataSource.save([sample])

        let result = dataSource.load()
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.firstName, "Maria")
    }
}
#endif
