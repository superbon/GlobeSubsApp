//
//  ContentView.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/5/25.
//
import SwiftUI
import SVProgressHUD
#if canImport(SwiftData)
import SwiftData
#endif

struct ContentView: View {
#if canImport(SwiftData)
    @Environment(\.modelContext) var modelContext
#else
    @Environment(\.managedObjectContext) var managedContext
#endif
    
    @State private var showSplash = true
    @State var viewModel: SubscriberListViewModel
    
    var body: some View {
        ZStack {
#if canImport(SwiftData)
            let local = LocalSubscriberDataSource(context: modelContext)
#else
            let local = CoreDataSubscriberDataSource(context: managedContext)
#endif
            let remote = RemoteSubscriberDataSource()
            let repository = DefaultSubscriberRepository(remote: remote, local: local)
            let viewModel = SubscriberListViewModel(repository: repository)
            
            SubscriberListView(viewModel: viewModel)
                .opacity(showSplash ? 0 : 1)
            
            if showSplash {
                
                SplashScreenView {
                    // After splash completes:
                    
                    SVProgressHUD.show(withStatus: "Loading Subscribers...")
                    Task {
                        
                        await viewModel.load()
                        
                        withAnimation {
                            showSplash = false
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    

    
#if canImport(SwiftData)
    @Environment(\.modelContext) var modelContext
let local = LocalSubscriberDataSource(context: modelContext)
#else
    @Environment(\.managedObjectContext) var managedContext
let local = CoreDataSubscriberDataSource(context: managedContext)
#endif
    
    let remote = RemoteSubscriberDataSource()
    let repository = DefaultSubscriberRepository(remote: remote, local: local)
    let viewModel = SubscriberListViewModel(repository: repository)
    ContentView(viewModel: viewModel)
        .modelContainer(for: SwiftDataSubscriberEntity.self, inMemory: true)
}
