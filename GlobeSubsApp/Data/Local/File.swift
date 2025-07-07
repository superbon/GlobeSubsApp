//
//  File.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation
import SwiftData

final class LocalSubsDataSource {
    let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func saveSubs(_ subs: [Subscriber]) {
        for sub in subs {
            let entity = SubscriberEntity(id: sub.id, firstName: sub.firstName, lastName: sub.lastName, address: sub.address, phoneNumber: sub.phoneNumber, isPostpaid: sub.isPostpaid, photoUrl: sub.photoUrl)
            context.insert(entity)
        }
        try? context.save()
    }

    func loadSubs() -> [Subscriber] {
        let results = (try? context.fetch(FetchDescriptor<SubscriberEntity>())) ?? []
        return results.map {
            Subscriber(id: $0.id, firstName: $0.firstName, lastName: $0.lastName, address: $0.address, phoneNumber: $0.phoneNumber, isPostpaid: $0.isPostpaid, photoUrl: $0.photoUrl)
        }
    }

    func deleteAll() {
        let all = try? context.fetch(FetchDescriptor<SubscriberEntity>())
        all?.forEach { context.delete($0) }
        try? context.save()
    }
}
