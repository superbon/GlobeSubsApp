//
//  LocalSubscriberDataSource.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation

// check if SwiftData is available. iOS17+
#if canImport(SwiftData)
import SwiftData


// where the save, load and clear is happening in local
@MainActor
final class LocalSubscriberDataSource {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func save(_ subscribers: [Subscriber]) {
        for s in subscribers {
            let entity = SwiftDataSubscriberEntity(id: s.id, firstName: s.firstName, lastName: s.lastName, gender: s.gender, email: s.email, address: s.address, phoneNumber: s.phoneNumber, isPostpaid: s.isPostpaid, photoUrl: s.photoUrl)
            context.insert(entity)
        }
        try? context.save()
    }

    func load() -> [Subscriber] {
        let entities = (try? context.fetch(FetchDescriptor<SwiftDataSubscriberEntity>())) ?? []
        return entities.map {
            Subscriber(id: $0.id, firstName: $0.firstName, lastName: $0.lastName, gender: $0.gender, email: $0.email, address: $0.address, phoneNumber: $0.phoneNumber, isPostpaid: $0.isPostpaid, photoUrl: $0.photoUrl)
        }
    }

    func clear() {
        let all = try? context.fetch(FetchDescriptor<SwiftDataSubscriberEntity>())
        all?.forEach { context.delete($0) }
        try? context.save()
    }
}
#endif
