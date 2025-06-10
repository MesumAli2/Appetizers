//
//  DeliveryWidgetLiveActivity.swift
//  DeliveryWidget
//
//  Created by Mesum Syed on 10/06/2025.
//

import ActivityKit
import WidgetKit
import SwiftUI


struct DeliveryActivityView: View{
    let context: ActivityViewContext<DeliveryAttributes>
    
    var body: some View{
        VStack{
            HStack{
                Label("Delivery", systemImage: "box.truck.fill") // Delivery icon and label
                    .font(.title3)
                    .foregroundColor(.green) // Green color for delivery status
                
                Spacer()
                
                VStack {
                  Text("Time left")
                    .font(.caption)
                  Text("\(context.state.timeRemaining / 60) min")
                    .font(.title2)
                }
                .padding(.horizontal)
            }
   
        }
  
    }
}


@main
@available(iOSApplicationExtension 16.2, *)
struct DeliveryLiveActivity: Widget {

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DeliveryAttributes.self) { context in
            // MARK: Lock Screen View
            // This is the default content displayed on the lock screen.
            DeliveryActivityView(context: context)
              
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Label("Delivery", systemImage: "box.truck.fill") // Delivery icon and label
                        .font(.title3)
                        .foregroundColor(.green) // Green color for delivery status
                }

                DynamicIslandExpandedRegion(.trailing) {
                    VStack(alignment: .trailing) {
                        Text("\(context.state.timeRemaining / 60) min") // Time remaining
                            .font(.title)
                            .fontWeight(.bold)
                        Text("ETA") // Estimated Time of Arrival label
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }

                DynamicIslandExpandedRegion(.center) {
                    // This region is often left empty or used for very specific central content.
                    // For a delivery app, the leading/trailing regions are usually sufficient.
                    Text("Status")
                }

                DynamicIslandExpandedRegion(.bottom) {
                    VStack(alignment: .leading) {
                        Text("Your order is \(context.state.deliveryStatus)") // Dynamic delivery status
                            .font(.headline)
                            .foregroundColor(.white)
                        ProgressView(value: Double(context.state.timeRemaining), total: Double(context.attributes.totalDeliveryTime)) {
                            Text("Progress") // Accessibility label
                        }
                        .progressViewStyle(.linear)
                        .tint(.green) // Progress bar color
                        .padding(.top, 5)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    .foregroundColor(.white) // Ensure text is visible on dark background
                }
            } compactLeading: {
                // Compact Leading: Content on the left side when the Dynamic Island is compact.
                Label("", systemImage: "box.truck.fill") // Simple delivery truck icon
                    .font(.caption)
                    .foregroundColor(.green)
            } compactTrailing: {
                // Compact Trailing: Content on the right side when the Dynamic Island is compact.
                Text("\(context.state.timeRemaining / 60) min") // Remaining time
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange) // Highlight time in orange
            } minimal: {
                // Minimal View: Content when the Dynamic Island is minimized (e.g., during a call).
                // Only a single icon or very short text is shown.
                Image(systemName: "box.truck.fill")
                    .foregroundColor(.green)
            }
            .contentMargins(.all, 0, for: .compactLeading) // Remove default content margins for better control
        }
    }
}


