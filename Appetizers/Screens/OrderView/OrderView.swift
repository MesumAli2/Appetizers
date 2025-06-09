//
//  OrderView.swift
//  Appetizers
//
//  Created by Mesum Syed on 27/05/2025.
//

import SwiftUI

struct OrderView: View {
    @State private var orderItems: [Appetizer] = MOCKDATA.appetizers

    var appetizer = MOCKDATA.sampleAppetizer
    var body: some View {
        NavigationView{
            VStack{
                List{
                
                    ForEach(orderItems){ appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }.onDelete(perform: deleteItems)
                    
                }
                    .listStyle(PlainListStyle())
                Spacer()
                Button{
                    
                } label: {

                    // with two-decimal formatting
                    ApButton(title: "\(appetizer.price, specifier: "%.2f") - Place Order")

                }


            }
            .navigationTitle("Order :)")

        }
    }
    func deleteItems(at offsets: IndexSet){
        orderItems.remove(atOffsets: offsets)
    }

}


#Preview {
    OrderView()
}
