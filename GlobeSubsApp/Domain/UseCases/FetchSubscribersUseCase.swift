//
//  FetchSubscribersUseCase.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation


// Business Logic and core get subs
final class FetchSubscribersUseCase {
    private let repository: SubscriberRepository

    init(repository: SubscriberRepository) {
        self.repository = repository
    }

    func execute() async -> [Subscriber] {
        (try? await repository.getSubscribers()) ?? []
    }
}
