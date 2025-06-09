//
//  Alert.swift
//  Appetizers
//
//  Created by Mesum Syed on 29/05/2025.
//

import Foundation
import SwiftUI

struct AlertItem : Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let disimissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("The data received from the server was invalid. Please contact support."),
        disimissButton: .default(Text("OK"))
    )
    
    static let invalidResponse = AlertItem(
        title: Text("Response Error"),
        message: Text("Invalid response from the server. Please try again later."),
        disimissButton: .default(Text("OK"))
    )
    
    static let invalidUrl = AlertItem(
        title: Text("URL Error"),
        message: Text("The URL is invalid. Please report this issue."),
        disimissButton: .default(Text("OK"))
    )
    
    static let unableToComplete = AlertItem(
        title: Text("Connection Error"),
        message: Text("Unable to complete your request. Please check your internet connection."),
        disimissButton: .default(Text("OK"))
    )
    //MARK: - Account Alerts
    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("The email entered dosent match the required prefix"),
        disimissButton: .default(Text("OK"))
    )
 
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message:Text( "Please ensure all fields in the form have been filled put."), disimissButton: .default(Text("Ok")))
    
    static let invalidFirstName = AlertItem(
        title: Text("Missing First Name"),
        message: Text("Please enter your first name."),
        disimissButton: .default(Text("OK"))
    )
    
    static let invalidLastName = AlertItem(
        title: Text("Missing Last Name"),
        message: Text("Please enter your last name."),
        disimissButton: .default(Text("OK"))
    )
    
    static let userSaveSuccess = AlertItem(
          title: Text("Profile Updated"),
          message: Text("Your changes have been saved successfully."),
          disimissButton: .default(Text("OK"))
      )
    static let invalidUserData = AlertItem(
        title: Text("User Error"),
        message: Text("We were unable to retrieve your user data. Please log in again."),
        disimissButton: .default(Text("OK"))
    )

}

