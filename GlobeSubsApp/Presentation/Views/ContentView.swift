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
    @Environment(\.modelContext) var context
#endif
    
    var body: some View {
#if canImport(SwiftData)
        let local = LocalSubscriberDataSource(context: context)
        let remote = RemoteSubscriberDataSource()
        let repo = DefaultSubscriberRepository(remote: remote, local: local)
        let viewModel = SubscriberListViewModel(repository: repo)
        SubscriberListView(viewModel: viewModel)
#else
        Text("SwiftData not supported on this version")
#endif
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
