//
//  OrderView.swift
//  Appetizers
//
//  Created by Mesum Syed on 27/05/2025.
//

import SwiftUI
import ActivityKit // 1. Import ActivityKit for Live Activities

struct OrderView: View {
    @EnvironmentObject var order: Order

    // 2. State variable to hold the Live Activity instance
    @State private var deliveryActivity: Activity<DeliveryAttributes>? = nil

    var body: some View {
        NavigationView {
            ZStack{
        
                VStack {
                        List {
                            ForEach(order.items) { appetizer in
                                AppetizerListCell(appetizer: appetizer)
                            }
                            .onDelete(perform: deleteItems) // Allows swiping to delete items
                        }
                  
                    Spacer()
                    Button {
                        // 3. Action to start Live Activity
                        startDeliveryLiveActivity()
                    } label: {
                        // Displays total price with two-decimal formatting and "Place Order"
                        ApButton(title: "\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 20) // Add some padding at the bottom for the button
            
                }
          
                if order.items.isEmpty {
                
                    EmptyState(imageName: "empty-order", message: "You Have no item in your order. \n Please add an appetizer!")

                }
              
            }
          
            .navigationTitle("Order :)") // Navigation bar title
        }
    }

    // Function to delete items from the order
    func deleteItems(at offsets: IndexSet) {
        order.removeItems(at: offsets)
    }

    // Function to start the Live Activity
    func startDeliveryLiveActivity() {
        // Ensure Live Activities are enabled and appropraite iOS version
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Live Activities are not enabled.")
            return
        }

        // Define initial attributes and state for the Live Activity
        let attributes = DeliveryAttributes(orderId: UUID().uuidString, customerName: "Mesum Syed", totalDeliveryTime: 1800) // 30 minutes
        let initialContentState = DeliveryAttributes.ContentState(timeRemaining: 1800, deliveryStatus: "preparing") // Initial state

        do {
            // Request to start the Live Activity
            deliveryActivity = try Activity<DeliveryAttributes>.request(
                attributes: attributes,
                contentState: initialContentState
                // You can add pushType to support push notifications for updates
                // pushType: .token // If you're using push notifications for updates
                // alertConfiguration: nil // Optional: Add an alert configuration for the activity start
            )
            print("Delivery Live Activity started with ID: \(deliveryActivity?.id ?? "N/A")")

            // You might want to update the activity state periodically,
            // or when the delivery status changes (e.g., from a server update).
            // Example of updating after a delay (for demonstration purposes):
            Task {
                var remaining = initialContentState.timeRemaining
                while remaining > 0 {
                    try await Task.sleep(for: .seconds(60)) // Update every minute
                    remaining -= 60
                    let updatedState = DeliveryAttributes.ContentState(timeRemaining: remaining, deliveryStatus: remaining > 600 ? "on the way" : "arriving soon")
                    await deliveryActivity?.update(using: updatedState)
                    print("Live Activity updated. Time remaining: \(remaining / 60) min")
                }
                // End activity when time runs out
                if remaining <= 0 {
                    let finalState = DeliveryAttributes.ContentState(timeRemaining: 0, deliveryStatus: "delivered")
                    await deliveryActivity?.end(using: finalState, dismissalPolicy: .after(.now + 5)) // End activity after 5 seconds
                    print("Live Activity ended.")
                    deliveryActivity = nil // Clear the reference
                }
            }

        } catch (let error) {
            print("Error starting Live Activity: \(error.localizedDescription)")
        }
    }

    // Function to end the Live Activity (optional, for explicit stopping)
    func endDeliveryLiveActivity() {
        Task {
            if let activity = deliveryActivity {
                let finalState = DeliveryAttributes.ContentState(timeRemaining: 0, deliveryStatus: "delivered")
                await activity.end(using: finalState, dismissalPolicy: .immediate) // End immediately
                print("Live Activity ended manually.")
                deliveryActivity = nil
            }
        }
    }
}

// MARK: - Preview
#Preview {
    OrderView()
        .environmentObject(Order()) // Provide an Order environment object for the preview
}
