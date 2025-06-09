//
//  AccountView.swift
//  Appetizers
//
//  Created by Mesum Syed on 27/05/2025.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.LastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                    
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button(action: {
                        
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save Changes")
                    })
                    
                }
                
                Section(header: Text("Requests"), content: {
                    Toggle("Extra Napking", isOn: $viewModel.user.extraNapkin)
                    
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }).toggleStyle(SwitchToggleStyle(tint:  .brandPrimary))
                
            }
            .navigationTitle("Account :)")
            
        }    .onAppear{
            DispatchQueue.main.async {
            
                viewModel.retrieveUser()

            }
        }
        
        .alert(item: $viewModel.alertItem) {
            alertItem in
            Alert(title: alertItem.title, message: alertItem.message,
                  dismissButton: alertItem.disimissButton)
        }
    }
}

#Preview {
    AccountView()
}
