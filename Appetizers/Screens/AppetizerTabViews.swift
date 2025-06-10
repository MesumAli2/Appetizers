//
//  ContentView.swift
//  Appetizers
//
//  Created by Mesum Syed on 26/05/2025.
//

import SwiftUI

struct AppetizerTabViews: View {
    @StateObject var order = Order()

    var body: some View {
        TabView{
            AppetizerListView()
                .environmentObject(order)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .environmentObject(order)
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }.accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizerTabViews()
}
