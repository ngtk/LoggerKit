public protocol LogDestinationProtocol {
    func write(_ message: Any, level: LogLevel, context: LogContextProtocol)
}

public class StandardOut: LogDestinationProtocol {
    public var formatter: LogFormatterProtocol

    public init() {
        formatter = DefaultLogFormatter()
    }

    public func write(_ message: Any, level: LogLevel, context: LogContextProtocol) {
        let message = formatter.format(message: message, level: level, context: context)
        print(message)
    }
}
