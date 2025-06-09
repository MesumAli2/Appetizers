//
//  FinalPriceButton.swift
//  Appetizers
//
//  Created by Mesum Syed on 09/06/2025.
//

import SwiftUI

struct FinalPriceButton : View {
    
    let price: Double
    
    var body: some View {
        Button {
            // add to order action
            print("tapped")
        } label: {
            ApButton(title: "$\(price, specifier: "%.2f") - Add to Order")
        }
        .padding(.bottom, 30)
    }
}


#Preview {
    FinalPriceButton(price: 5.99)
}
