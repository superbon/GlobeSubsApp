//
//  RemoteSubscriberDataSource.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation
import Alamofire


// Remote data source where the data is pulling from API https://api.mockaroo.com
final class RemoteSubscriberDataSource {
    func fetchSubscribers() async throws -> [Subscriber] {
        let url = "https://api.mockaroo.com/api/49f77500?count=10&key=ff232470"
        let data = try await AF.request(url).serializingData().value
        return try JSONDecoder().decode([Subscriber].self, from: data)
    }
}
