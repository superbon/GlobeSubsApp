//
//  SubscriberRepository.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation

// implementing the protocol
protocol SubscriberRepository {
    func getSubscribers() async throws -> [Subscriber]
}
