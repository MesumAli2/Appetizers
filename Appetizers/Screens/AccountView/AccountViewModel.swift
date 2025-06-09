//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Mesum Syed on 02/06/2025.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("user") private var userData: Data?

    // Just checks validity—no side effects
    var isValidForm: Bool {
        return !user.firstName.isEmpty
            && !user.LastName.isEmpty
    }

    func saveChanges() {
        // First, run validations and set alertItem if needed
        if isValidForm  {
            alertItem = AlertContext.invalidForm
            return
        }else if user.email.isEmpty || !user.email.isValidEmail {
            alertItem = AlertContext.invalidEmail
            return
        }

        // If we reach here, form is valid—encode and save
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }

    func retrieveUser() {
        guard let storeData = userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: storeData)
        } catch {
            alertItem = AlertContext.invalidData
        }
    }
}
