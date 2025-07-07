//
//  GlobeSubsAppApp.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/5/25.
//

import SwiftUI
#if canImport(SwiftData)
import SwiftData
#else
import CoreData
#endif

@main
struct GlobeSubsAppApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
#if canImport(SwiftData)
        .modelContainer(for: SubscriberEntity.self)
#else
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
#endif
    }
}
