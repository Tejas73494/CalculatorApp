//
//  CalculatorButton.swift
//
//
//  Created by Tejas Naik on 6/1/25.
//

import SwiftUI
import Lottie

// MARK: - LottieView
struct LottieView: UIViewRepresentable {
    let animationName: String
    let loopMode: LottieLoopMode

    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationName)
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        return animationView
    }

    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
    }
}

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    let splashScreenDuration: Double = 3.0

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Spacer()

                LottieView(animationName: "IphoneSplashScreen", loopMode: .playOnce)
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 1.0
                            self.opacity = 1.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + splashScreenDuration) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }

                Spacer()
            }
            .background(Color.white.ignoresSafeArea())
        }
    }
}


