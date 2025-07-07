//
//  CoreDataSubscriberDataSource.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/8/25.
//

import Foundation
#if !canImport(SwiftData)
import CoreData
import UIKit

final class CoreDataSubscriberDataSource {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
    }

    func save(_ subscribers: [Subscriber]) {
        clear()
        for s in subscribers {
            let entity = NSEntityDescription.insertNewObject(forEntityName: "SubscriberEntity", into: context)
            entity.setValue(s.id, forKey: "id")
            entity.setValue(s.firstName, forKey: "firstName")
            entity.setValue(s.lastName, forKey: "lastName")
            entity.setValue(s.lastName, forKey: "gender")
            entity.setValue(s.lastName, forKey: "email")
            entity.setValue(s.address, forKey: "address")
            entity.setValue(s.phoneNumber, forKey: "phoneNumber")
            entity.setValue(s.isPostpaid, forKey: "isPostpaid")
            entity.setValue(s.photoUrl, forKey: "photoUrl")
        }
        try? context.save()
    }

    func load() -> [Subscriber] {
        let request = NSFetchRequest<NSManagedObject>(entityName: "SubscriberEntity")
        let result = (try? context.fetch(request)) ?? []
        return result.map {
            Subscriber(
                id: $0.value(forKey: "id") as? Int ?? 0,
                firstName: $0.value(forKey: "firstName") as? String ?? "",
                lastName: $0.value(forKey: "lastName") as? String ?? "",
                gender: $0.value(forKey: "gender") as? String ?? "",
                email: $0.value(forKey: "email") as? String ?? "",
                address: $0.value(forKey: "address") as? String ?? "",
                phoneNumber: $0.value(forKey: "phoneNumber") as? String ?? "",
                isPostpaid: $0.value(forKey: "isPostpaid") as? Bool ?? false,
                photoUrl: $0.value(forKey: "photoUrl") as? String ?? ""
            )
        }
    }

    func clear() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SubscriberEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try? context.execute(deleteRequest)
        try? context.save()
    }
}
#endif
