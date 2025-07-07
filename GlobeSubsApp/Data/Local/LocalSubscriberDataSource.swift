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
final class LocalSubscriberDataSource {
    let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func save(_ list: [Subscriber]) {
        for s in list {
            let entity = SubscriberEntity(id: s.id, firstName: s.firstName, lastName: s.lastName, address: s.address, phoneNumber: s.phoneNumber, isPostpaid: s.isPostpaid, photoUrl: s.photoUrl)
            context.insert(entity)
        }
        try? context.save()
    }

    func load() -> [Subscriber] {
        let items = (try? context.fetch(FetchDescriptor<SubscriberEntity>())) ?? []
        return items.map { Subscriber(id: $0.id, firstName: $0.firstName, lastName: $0.lastName, address: $0.address, phoneNumber: $0.phoneNumber, isPostpaid: $0.isPostpaid, photoUrl: $0.photoUrl) }
    }

    func clear() {
        let items = try? context.fetch(FetchDescriptor<SubscriberEntity>())
        items?.forEach { context.delete($0) }
        try? context.save()
    }
}
#endif
