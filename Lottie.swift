import SwiftUI
import Lottie // Make sure you have Lottie installed via Swift Package Manager

// MARK: - LottieView
/// A SwiftUI View that wraps Lottie's AnimationView to display Lottie animations.
struct LottieView: UIViewRepresentable {
    let animationName: String
    let loopMode: LottieLoopMode

    /// Creates and configures the Lottie AnimationView.
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationName)
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit // Adjust content mode as needed
        animationView.play() // Start playing the animation immediately
        return animationView
    }

    /// Updates the Lottie AnimationView (not typically needed for simple playback).
    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
        // No update logic needed for this simple splash screen use case.
        // If you needed to change animation or loop mode dynamically, you'd do it here.
    }
}

struct SplashScreenView: View {
    @State private var isActive = false // State to control splash screen visibility
    @State private var size = 0.8 // Initial size for a subtle bounce effect
    @State private var opacity = 0.5 // Initial opacity for a fade-in effect

    // Define the duration for the splash screen to be displayed.
    // Adjust this based on your Lottie animation's length.
    let splashScreenDuration: Double = 3.0 // Example: 3 seconds

    var body: some View {
        if isActive {
            // Once splash screen duration is over, show the main content view
            ContentView() // Your main Calculator app content view
        } else {
            VStack {
                Spacer() // Pushes content to the center

                // Display your Lottie animation
                LottieView(animationName: "IphoneSplashScreen", loopMode: .playOnce)
                    .scaleEffect(size) // Apply scale effect for animation
                    .opacity(opacity) // Apply opacity for animation
                    .onAppear {
                        // Animate the size and opacity when the view appears
                        withAnimation(.easeIn(duration: 1.2)) { // Adjust animation duration
                            self.size = 1.0 // Scale up to normal size
                            self.opacity = 1.0 // Fade in to full opacity
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

