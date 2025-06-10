//
//  ApButton.swift
//  Appetizers
//
//  Created by Mesum Syed on 02/06/2025.
//

import SwiftUI

struct ApButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(10)
    }
}

#Preview {
    ApButton(title: "Test Title")
}
