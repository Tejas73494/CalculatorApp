# Calculator App (iOS)

This is a fully functional, simple calculator app built with **Swift using Xcode**. This app was created to **demonstrate my skills and understanding in Swift, SwiftUI, and using Xcode**. It showcases both functionality and responsive design using modern iOS development tools and practices.

Check out the demo [here!](https://drive.google.com/file/d/1Matbf0vDDmxKbKBiOMLyWznH8SQOa5IZ/view?usp=sharing)

## 🚀 Features

### ✨ Splash Screen with Lottie Animation
Upon launch, the app presents a beautiful splash screen animated with **Lottie** created in **Figma**.
- **Design Tool:** The animation was meticulously crafted in **Figma**, ensuring a polished and branded introduction.
- **Animation Format:** It utilizes a Lottie JSON file, which provides lightweight, scalable, and high-quality animations.
- **Seamless Integration:** The Lottie animation was seamlessly incorporated into the Xcode project using the **Lottie iOS SDK**, appearing gracefully upon app launch before transitioning to the main calculator interface.

### 📱 Landscape Mode Support
The app fully supports **landscape (horizontal) mode**. When the device is rotated:
- The UI adapts smoothly.
- The **number storage area** (where current calculations or memory are shown) dynamically **moves to the left** side of the screen for optimal readability and usability.

### 🖼 Custom App Icon Support

The app includes a fully customized **iOS app icon**, designed to integrate beautifully with different iOS themes:

- 🌞 **Light Mode**: High-contrast icon variation for bright backgrounds
- 🌚 **Dark Mode**: Alternate variation optimized for dark mode
- 🎨 **Tinted/Accent Adaptive**: Icon version respects the system’s accent color and applies a subtle tint for cohesion

This gives the app a polished, platform-native look and feel across all display environments.

### ➗ Basic Calculator Functionality
- Addition (+)
- Subtraction (−)
- Multiplication (×)
- Division (÷)
- Decimal numbers (.)
- Percents (%)
- negative numbers (-)
- Clear, equals, and input correction

All core operations are implemented with Swift’s robust number handling to ensure precision and reliability.

### 🎯 Clean, Responsive UI
- Built with **SwiftUI** and Auto Layout for dynamic screen adaptation
- Touch-friendly buttons with haptic feedback (if supported)
- Intuitive design inspired by native iOS components

### 💾 State Preservation
The app preserves its current state during backgrounding or orientation changes, so users don’t lose their place in a calculation.

## 🛠 Technologies Used
- **Swift/SwiftUI & Xcode**: Core development tools for iOS
- **UIKit**: For building responsive and dynamic UI
- **Figma**: For designing the Lottie splash animation
- **Lottie for iOS**: To render smooth vector animations
