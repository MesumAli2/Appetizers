//
//  FinalPriceButton.swift
//  Appetizers
//
//  Created by Mesum Syed on 09/06/2025.
//

import SwiftUI

struct FinalPriceButton : View {

    let appetizer: Appetizer
    @EnvironmentObject var order: Order
    @Binding var isShowingDetail:Bool

    var body: some View {
        Button {
            order.add(appetizer)
            isShowingDetail = false
            
        } label: {
            ApButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
        }
        .padding(.bottom, 30)
    }
}


#Preview {
    FinalPriceButton(appetizer: MOCKDATA.sampleAppetizer, isShowingDetail: .constant(true))
        .environmentObject(Order())
}
