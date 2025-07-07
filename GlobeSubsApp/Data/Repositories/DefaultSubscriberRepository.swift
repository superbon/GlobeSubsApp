//
//  DefaultSubscriberRepository.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation



// default repo where local and remote call
final class DefaultSubscriberRepository: SubscriberRepository {
    let remote: RemoteSubscriberDataSource
    let local: Any

    init(remote: RemoteSubscriberDataSource, local: Any) {
        self.remote = remote
        self.local = local
    }
    
//    init(remote: RemoteSubscriberDataSource, local: Any) {
//        self.remote = remote
//    }

    func getSubscribers() async throws -> [Subscriber] {
        do {
            let remoteData = try await remote.fetchSubscribers()
#if canImport(SwiftData)
            await (local as? LocalSubscriberDataSource)?.clear()
            await (local as? LocalSubscriberDataSource)?.save(remoteData)
#else
            (local as? CoreDataSubscriberDataSource)?.clear()
            (local as? CoreDataSubscriberDataSource)?.save(remoteData)
#endif
            return remoteData
        } catch {
#if canImport(SwiftData)
            return await (local as? LocalSubscriberDataSource)?.load() ?? []
#else
            return (local as? CoreDataSubscriberDataSource)?.load() ?? []
#endif
        }
    }
}
