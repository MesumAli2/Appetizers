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
}

