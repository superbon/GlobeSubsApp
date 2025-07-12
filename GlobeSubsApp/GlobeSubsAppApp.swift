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
            ContentView(viewModel: makeViewModel())
                            .modelContainer(for: SwiftDataSubscriberEntity.self)
        }
#if canImport(SwiftData)
        .modelContainer(for: SwiftDataSubscriberEntity.self)
#else
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
#endif
    }
    
    
    func makeViewModel() -> SubscriberListViewModel {
        let container = try! ModelContainer(for: SwiftDataSubscriberEntity.self)
        let context = ModelContext(container)
        let local = LocalSubscriberDataSource(context: context)

        let remote = RemoteSubscriberDataSource()
        let repository = DefaultSubscriberRepository(remote: remote, local: local)

        return SubscriberListViewModel(repository: repository)
    }
}
