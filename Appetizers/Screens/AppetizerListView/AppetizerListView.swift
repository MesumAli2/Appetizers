//  AppetizerListView.swift
//  Appetizers

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewVM()

    // ← add this to hold whichever row was tapped

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    // wrap each cell in a Button (or onTapGesture)
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedAppetizer = appetizer
                        }
                            
                }
                .navigationTitle("Appetizers")
                .disabled( viewModel.isShowingDetail)
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius:  viewModel.isShowingDetail ? 20 : 0)

            if  viewModel.isShowingDetail{
            
                OrderDetailsView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)

            }

            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertITem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.disimissButton
            )
        }
        // ← present OrderDetailsView whenever `selectedAppetizer` is non‐nil
       
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
