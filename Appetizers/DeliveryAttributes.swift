//
//  DeliveryAttributes.swift
//  Appetizers
//
//  Created by Mesum Syed on 10/06/2025.
//

import Foundation
import ActivityKit
import SwiftUI



struct DeliveryAttributes: ActivityAttributes {

    let orderId: String
    let customerName: String
    let totalDeliveryTime: Int // Total expected delivery time in seconds

    // Dynamic state (updates over time)
    public struct ContentState: Codable, Hashable {
        var timeRemaining: Int // Time remaining for delivery in seconds
        var deliveryStatus: String // e.g., "preparing", "on the way", "arrived"
    }
}
