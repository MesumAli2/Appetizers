//
//  AppetizerVM.swift
//  Appetizers
//
//  Created by Mesum Syed on 29/05/2025.
//

import Foundation

class AppetizerListViewVM: ObservableObject{

    @Published var appetizers: [Appetizer] = []
    @Published var alertITem: AlertItem?
    @Published var isLoading = false

    
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers { [self] (result) in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let success):
                    self.appetizers = success
                case .failure(let failure):
                    switch failure{
                    case .invalidData:
                        self.alertITem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertITem = AlertContext.invalidUrl

                    case .invalidResponse:
                        self.alertITem = AlertContext.invalidResponse

                    case .unableToComplete:
                        self.alertITem = AlertContext.invalidResponse

                    }
                }
            }
           
        }
    }
}
