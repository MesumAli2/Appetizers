//  DeliveryActivityManager.swift
//  Appetizers
//
//  Created by Mesum Syed on 09/06/2025.
//

import Foundation
import ActivityKit
import WidgetKit
import SwiftUI



enum DeliveryActivityManager {
  
  static func start(minutes: Int = 15) {
    guard #available(iOS 16.2, *),
          ActivityAuthorizationInfo().areActivitiesEnabled
    else { return }
    
    let attrs = DeliveryAttributes(orderId: "ORD-123456")
    let initialState = DeliveryAttributes.ContentState(timeRemaining: minutes * 60)
    let content = ActivityContent(state: initialState, staleDate: nil)
    
    do {
      let activity = try Activity<DeliveryAttributes>.request(
        attributes: attrs,
        content: content,
        pushType: nil
      )
      print("Live Activity started: \(activity.id)")
    } catch {
      print("Failed to start Live Activity:", error.localizedDescription)
    }
  }
  
  static func update( activity: Activity<DeliveryAttributes>, to minutes: Int) {
    Task {
      let newState = DeliveryAttributes.ContentState(timeRemaining: minutes * 60)
      await activity.update(using: newState)
    }
  }
  
  static func end(activity: Activity<DeliveryAttributes>) {
    Task {
      await activity.end(dismissalPolicy: .immediate)
    }
  }
}
