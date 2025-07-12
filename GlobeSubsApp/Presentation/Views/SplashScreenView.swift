//
//  SplashScreenView.swift
//  GlobeSubsApp
//
//  Created by Bon Ryan on 7/5/25.
//

import SwiftUI
import RevealingSplashView

struct SplashScreenView: UIViewRepresentable {
    let onCompletion: () -> Void

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)

        let image = UIImage(named: "LaunchScreen") ?? UIImage(systemName: "LaunchScreen")!
        let splash = RevealingSplashView(
            iconImage: image,
            iconInitialSize: CGSize(width: 250, height: 250),
            backgroundColor: UIColor(named: "BlueColor") ?? UIColor.blue
        )

        splash.animationType = .swingAndZoomOut
        view.addSubview(splash)

        splash.startAnimation {
                    onCompletion()
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    SplashScreenView {
        withAnimation {
        }
    }
}
