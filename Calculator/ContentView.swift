//
//  ContentView.swift
//  First App
//
//  Created by Tejas Naik on 5/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var total = "0"
    var body: some View {
        VStack {
            TotalText(value: total)
            ButtonGrid(total: $total)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

