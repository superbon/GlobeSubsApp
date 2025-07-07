//
//  PersistenceController.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation

// if SwiftData is not implemented or not compatible iOS 16 below
#if !canImport(SwiftData)
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "GlobeSubsApp")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data store failed: \(error.localizedDescription)")
            }
        }
    }
}
#endif
