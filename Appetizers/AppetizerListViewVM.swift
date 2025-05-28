//
//  AppetizerVM.swift
//  Appetizers
//
//  Created by Mesum Syed on 29/05/2025.
//

import Foundation

class AppetizerListViewVM: ObservableObject{

    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers(){
        NetworkManager.shared.getAppetizers { (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.appetizers = success
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
           
        }
    }
}
