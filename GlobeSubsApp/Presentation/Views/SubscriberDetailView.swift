//
//  SubscriberDetailView.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation
import SwiftUI
import Kingfisher

struct SubscriberDetailView: View {
    let subscriber: Subscriber

    var body: some View {
        VStack(spacing: 20) {
            KFImage(URL(string: subscriber.photoUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 160)
                .clipShape(Circle())
            Text(subscriber.fullName).font(.title).bold()
            Text(subscriber.address)
            Text("Phone: \(subscriber.phoneNumber)")
            Text("Email: \(subscriber.email)")
            Text(subscriber.isPostpaid ? "Postpaid" : "Prepaid")
                .foregroundColor(.gray)
        }
        .padding()
    }
}
