//
//  OrderView.swift
//  Appetizers
//
//  Created by Mesum Syed on 27/05/2025.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            VStack{
                List{

                    ForEach(order.items){ appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }.onDelete(perform: deleteItems)
                    
                }
                    .listStyle(PlainListStyle())
                Spacer()
                Button{
                    DeliveryActivityManager.start()
                } label: {

                    // with two-decimal formatting
                    ApButton(title: "\(order.totalPrice, specifier: "%.2f") - Place Order")

                }


            }
            .navigationTitle("Order :)")

        }
    }
    func deleteItems(at offsets: IndexSet){
        order.removeItems(at: offsets)
    }

}


#Preview {
    OrderView()
        .environmentObject(Order())
}
