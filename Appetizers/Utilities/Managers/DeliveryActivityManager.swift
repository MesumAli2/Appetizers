//  DeliveryActivityManager.swift
//  Appetizers
//
//  Created by Mesum Syed on 09/06/2025.
//

import Foundation
import ActivityKit

struct DeliveryAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var timeRemaining: Int
    }
}

enum DeliveryActivityManager {
  static func start() {
    guard #available(iOS 16.2, *),
          ActivityAuthorizationInfo().areActivitiesEnabled
    else { return }
    let attributes = DeliveryAttributes()
    let state = DeliveryAttributes.ContentState(timeRemaining: 15 * 60)
    let content = ActivityContent(state: state, staleDate: nil)
    do {
      _ = try Activity<DeliveryAttributes>.request(
        attributes: attributes,
        content: content,
        pushType: nil
      )
    } catch {
      print("Unable to start activity: \(error)")
    }
  }
}

