//
//  SubscriberDetailView.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/7/25.
//

import Foundation
import SwiftUI
import Kingfisher
import LetterAvatarKit

struct SubscriberDetailView: View {
    let subscriber: Subscriber

    var body: some View {
        VStack(spacing: 20) {
            SubscriberAvatarView(
                name: subscriber.fullName,
                photoURL: subscriber.photoUrl,
                size: 160,
                borderColor: Color("BorderColor"),
                borderWidth: 1
            )
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
