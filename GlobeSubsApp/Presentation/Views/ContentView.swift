//
//  ContentView.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/5/25.
//
import SwiftUI
#if canImport(SwiftData)
import SwiftData
#endif

struct ContentView: View {
#if canImport(SwiftData)
    @Environment(\.modelContext) var modelContext
#else
    @Environment(\.managedObjectContext) var managedContext
#endif

    var body: some View {
#if canImport(SwiftData)
        let local = LocalSubscriberDataSource(context: modelContext)
#else
        let local = CoreDataSubscriberDataSource(context: managedContext)
#endif
        let remote = RemoteSubscriberDataSource()
        let repository = DefaultSubscriberRepository(remote: remote, local: local)
        let viewModel = SubscriberListViewModel(repository: repository)
        SubscriberListView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
