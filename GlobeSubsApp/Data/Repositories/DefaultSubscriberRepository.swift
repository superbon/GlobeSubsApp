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
    let local: LocalSubscriberDataSource

    init(remote: RemoteSubscriberDataSource, local: LocalSubscriberDataSource) {
        self.remote = remote
        self.local = local
    }
    
//    
//    init(remote: RemoteSubscriberDataSource) {
//        self.remote = remote
//    }

    func getSubscribers() async throws -> [Subscriber] {
        
        
        
        do {
            
            
            let remoteData = try await remote.fetchSubscribers()
            await local.clear()
            await local.save(remoteData)
            return remoteData
        } catch {
            return await local.load()
        }
    }
}
