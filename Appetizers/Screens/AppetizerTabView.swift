//
//  ContentView.swift
//  Appetizers
//
//  Created by Mesum Syed on 26/05/2025.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
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
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }.accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
