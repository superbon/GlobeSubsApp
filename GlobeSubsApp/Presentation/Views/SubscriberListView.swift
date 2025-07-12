//
//  SubscriberListView.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation
import SwiftUI
import Kingfisher

struct SubscriberListView: View {
    @StateObject var viewModel: SubscriberListViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.subscribers) { sub in
                NavigationLink(destination: SubscriberDetailView(subscriber: sub)) {
                    HStack {
                        SubscriberAvatarView(name: sub.fullName,
                                             photoURL: sub.photoUrl,
                                             size: 60,
                                             borderColor: Color("BorderColor"),
                                             borderWidth: 1)
                        
                        VStack(alignment: .leading) {
                            Text(sub.fullName).bold()
                            Text(sub.phoneNumber).font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Globe Subscribers")
            .task {
                do {
                    try await viewModel.load()
                } catch {
                    print("Error loading subscribers: \\(error)")
                }
            }.onAppear {
                print("On Appear = \(viewModel.subscribers)")
            }
        }
    }
}
