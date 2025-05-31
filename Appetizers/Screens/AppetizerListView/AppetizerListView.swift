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
        
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizers in
                    
                    AppetizerListCell(appetizer: appetizers)
                    
                }
                .onAppear{
                    viewModel.getAppetizers()
                }
              .listStyle(.plain).navigationTitle("Appetizers")
                
            }
            
            if viewModel.isLoading{
                LoadingView()
            }
            
        }.alert(item: $viewModel.alertITem){
            alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.disimissButton)
        }
     
    }
    
   
}

#Preview {
    AppetizerListView()
}

