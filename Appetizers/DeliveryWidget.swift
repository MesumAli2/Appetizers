//
//  DeliveryWidget.swift
//  Appetizers
//
//  Created by Mesum Syed on 10/06/2025.
//

import Foundation

@main
struct DeliveryWidget: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: DeliveryAttributes.self) { context in
      // Lock screen / banners
      VStack {
        Text("Time left:")
        Text("\(context.state.timeRemaining / 60) min")
          .font(.title)
      }
      .activityBackgroundTint(.cyan)
      .activitySystemActionForegroundColor(.white)
    } dynamicIsland: { context in
      // (Optional) Dynamic Island layout
      DynamicIsland {
        DynamicIslandExpandedRegion(.center) {
          Text("\(context.state.timeRemaining / 60) min left")
        }
      } compactLeading: {
        Text("\(context.state.timeRemaining / 60)m")
      } compactTrailing: {
        Image(systemName: "timer")
      } minimal: {
        Image(systemName: "bicycle")
      }
    }
  }
}
