//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mesum Syed on 27/05/2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewVM()
    
    
    
    var body: some View {
        NavigationView{
            List(viewModel.appetizers){ appetizers in
                
                AppetizerListCell(appetizer: appetizers)
                
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .listStyle(.plain)
            .navigationTitle("Appetizers")
            
        }
    }
    
   
}

#Preview {
    AppetizerListView()
}

