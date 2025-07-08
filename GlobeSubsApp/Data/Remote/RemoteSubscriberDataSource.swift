//
//  RemoteSubscriberDataSource.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation
import Alamofire


// Remote data source where the data is pulling from API https://api.mockaroo.com
class RemoteSubscriberDataSource {
    
    let global = Global()
    
    func fetchSubscribers() async throws -> [Subscriber] {
        let url = global.mockURLString()
        let data = try await AF.request(url).serializingData().value
        
        print("data:", String(data: data, encoding: .utf8) ?? "nil")
        let subscribers = try JSONDecoder().decode([Subscriber].self, from: data)
        return subscribers
    }
}

