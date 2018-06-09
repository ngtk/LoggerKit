import Foundation

public protocol LogFormatterProtocol {
    func format(message: Any, level: LogLevel, context: LogContextProtocol) -> String
}

public class DefaultLogFormatter: LogFormatterProtocol {
    public func format(message: Any, level: LogLevel, context: LogContextProtocol) -> String {
        return "\(formatedTime()) [\(level.rawValue.uppercased())] \(message)"
    }

    func formatedTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ssZZZZZ"
        return formatter.string(from: date)
    }
}