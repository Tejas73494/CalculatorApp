//
//  ContentView.swift
//  First App
//
//  Created by Tejas Naik on 5/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var total = "0"

    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        if verticalSizeClass == .compact {
            HStack {
                TotalText(value: total)
                    .frame(height: 100)
                    .font(.largeTitle)

                ButtonGrid(total: $total)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding()
        } else {
            VStack {
                TotalText(value: total)
                ButtonGrid(total: $total)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

