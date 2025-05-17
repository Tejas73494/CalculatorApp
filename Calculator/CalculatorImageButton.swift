//
//  CalculatorImageButton.swift
//  First App
//
//  Created by Tejas Naik on 5/11/25.
//

import SwiftUI

struct CalculatorImageButton: View {
    var buttonText = "plus"
    var width: CGFloat = 70
    var color = Color(hue: 1.0, saturation: 0, brightness: 0.283)
    var action: (CalculatorImageButton) -> Void = {_ in }
    var mode: CalculatorMode = .notSet
    var body: some View {
        Button(action: {
            action(self)
        }, label: {
            Image(systemName: buttonText)
                .font(.largeTitle)
                .frame(width: width, height: 70, alignment: .center)
                .background(color)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        })
    }
}

#Preview {
    CalculatorImageButton()
}

