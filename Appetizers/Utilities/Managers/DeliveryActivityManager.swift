import ActivityKit
import Foundation

struct DeliveryAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var timeRemaining: Int
    }
}

enum DeliveryActivityManager {
    static func start() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }
        let attributes = DeliveryAttributes()
        let state = DeliveryAttributes.ContentState(timeRemaining: 15 * 60)
        do {
            _ = try Activity<DeliveryAttributes>.request(attributes: attributes,
                                                         contentState: state,
                                                         pushType: nil)
        } catch {
            print("Unable to start activity: \(error)")
        }
    }
}
