//
//  LetterAvatarView.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/12/25.
//
import SwiftUI
import Kingfisher
import LetterAvatarKit

struct LetterAvatarView: UIViewRepresentable {
    let name: String
    let size: CGFloat
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = LetterAvatarMaker()
            .setUsername(name)
            .setCircle(true)
            .setSize(CGSize(width: size, height: size))
            .build()
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.image = LetterAvatarMaker()
            .setUsername(name)
            .setCircle(true)
            .setSize(CGSize(width: size, height: size))
            .build()
    }
}

struct SubscriberAvatarView: View {
    let name: String
    let photoURL: String?
    let size: CGFloat
    
    var borderColor: Color = .white
    var borderWidth: CGFloat = 1
    
    private var fallbackImage: UIImage {
        LetterAvatarMaker()
            .setUsername(name)
            .setCircle(true)
            .setSize(CGSize(width: size, height: size))
            .build()!
    }
    
    var body: some View {
        ZStack {
            if let url = URL(string: photoURL ?? "") {
                KFImage(url)
                    .placeholder {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    }
                    .onFailureImage(fallbackImage)
                    .resizable()
                    .scaledToFill()
            } else {
                Image(uiImage: fallbackImage)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(borderColor, lineWidth: borderWidth)
        )
    }
}
