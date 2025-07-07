//
//  SubscriberListViewModel.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation
import SVProgressHUD


@MainActor
final class SubscriberListViewModel: ObservableObject {
    @Published var subscribers: [Subscriber] = []
    private let repository: SubscriberRepository
    
    init(repository: SubscriberRepository) {
        self.repository = repository
    }
    
    func load() async {
        SVProgressHUD.show(withStatus: "Loading Subscribers...")
        
        do {
            subscribers = try await repository.getSubscribers()
            await SVProgressHUD.dismiss()
        } catch {
            SVProgressHUD.showError(withStatus: "Failed to load")
        }
    }
}


