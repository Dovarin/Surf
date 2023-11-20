import UIKit

public final class TimeFormatter {
    
    // MARK: - Initialization
    
    public init() {}

    // MARK: - Public Methods
    
    public func format(_ seconds: Int, isShortFormat: Bool) -> String {
        let timeComponents = calculateTimeComponents(from: seconds)
        return isShortFormat ? formatForTimer(timeComponents) : formatForAlert(timeComponents)
    }
}

// MARK: - Private Function

extension TimeFormatter {
    private func calculateTimeComponents(from seconds: Int) -> (hours: Int, minutes: Int, seconds: Int) {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60
        return (hours, minutes, seconds)
    }

    private func formatForTimer(_ timeComponents: (hours: Int, minutes: Int, seconds: Int)) -> String {
        return String(
            format: "%02d:%02d",
            timeComponents.minutes,
            timeComponents.seconds
        )
    }

    private func formatForAlert(_ timeComponents: (hours: Int, minutes: Int, seconds: Int)) -> String {
        switch timeComponents {
        case let (hours, minutes, _) where hours > 0 && minutes > 0:
            return String(format: "%d ч. %d мин.", hours, minutes)
        case let (hours, _, _) where hours > 0:
            return String(format: "%d ч.", hours)
        case let (_, minutes, _) where minutes > 0:
            return String(format: "%d мин.", minutes)
        default:
            return String(format: "%d сек", timeComponents.seconds)
        }
    }
}
