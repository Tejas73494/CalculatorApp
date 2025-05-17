//
//  TotalText.swift
//  First App
//
//  Created by Tejas Naik on 5/10/25.
//

import SwiftUI

struct TotalText: View {
    var value = "0"
    var body: some View {
        Text(value)
            .frame(width: 260, alignment: .bottomTrailing)
            .fontWeight(.light)
            .font(.system(size: 80))
            .padding()
            .lineLimit(1)
    }
}

#Preview {
    TotalText()
}

