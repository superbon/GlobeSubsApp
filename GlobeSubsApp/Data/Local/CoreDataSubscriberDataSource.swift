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
    
    let global = Global()
    
    

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
    }

    func save(_ subscribers: [Subscriber]) {
        clear()
        print("global.entityNameString= \(global.entityNameString)")
        for s in subscribers {
            let entity = NSEntityDescription.insertNewObject(forEntityName: global.entityNameString, into: context)
            entity.setValue(s.id, forKey: KeyIdName.id.displayName)
            entity.setValue(s.firstName, forKey: KeyIdName.firstName.displayName)
            entity.setValue(s.lastName, forKey: KeyIdName.lastName.displayName)
            entity.setValue(s.gender, forKey: KeyIdName.gender.displayName)
            entity.setValue(s.email, forKey: KeyIdName.email.displayName)
            entity.setValue(s.address, forKey: KeyIdName.address.displayName)
            entity.setValue(s.phoneNumber, forKey: KeyIdName.phoneNumber.displayName)
            entity.setValue(s.isPostpaid, forKey: KeyIdName.isPostpaid.displayName)
            entity.setValue(s.photoUrl, forKey: KeyIdName.photoUrl.displayName)
        }
        try? context.save()
    }

    func load() -> [Subscriber] {
        let request = NSFetchRequest<NSManagedObject>(entityName: global.entityNameString)
        let result = (try? context.fetch(request)) ?? []
        return result.map {
            Subscriber(
                id: $0.value(forKey: KeyIdName.id.displayName) as? Int ?? 0,
                firstName: $0.value(forKey: KeyIdName.firstName.displayName) as? String ?? "",
                lastName: $0.value(forKey: KeyIdName.lastName.displayName) as? String ?? "",
                gender: $0.value(forKey: KeyIdName.gender.displayName) as? String ?? "",
                email: $0.value(forKey: KeyIdName.email.displayName) as? String ?? "",
                address: $0.value(forKey: KeyIdName.id.displayName) as? String ?? "",
                phoneNumber: $0.value(forKey: KeyIdName.phoneNumber.displayName) as? String ?? "",
                isPostpaid: $0.value(forKey: KeyIdName.isPostpaid.displayName) as? Bool ?? false,
                photoUrl: $0.value(forKey: KeyIdName.photoUrl.displayName) as? String ?? ""
            )
        }
    }

    func clear() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: global.entityNameString)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try? context.execute(deleteRequest)
        try? context.save()
    }
}
#endif
