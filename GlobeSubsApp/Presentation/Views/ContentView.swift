//
//  ContentView.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        Text("Hello Bon").bold().padding()
       
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
