public protocol LoggerProtocol {
    func send(level: LogLevel, message: Any, context: LogContextProtocol)
}

extension LoggerProtocol {
    public func debug(
        _ message: Any,
        function: String = #function,
        file: String = #file,
        line: Int = #line
    ) {
        let context = LogContext(function: function, file: file, line: line)
        send(level: .debug, message: message, context: context)
    }

    public func verbose(
        _ message: Any,
        function: String = #function,
        file: String = #file,
        line: Int = #line
    ) {
        let context = LogContext(function: function, file: file, line: line)
        send(level: .verbose, message: message, context: context)
    }

    public func info(
        _ message: Any,
        function: String = #function,
        file: String = #file,
        line: Int = #line
    ) {
        let context = LogContext(function: function, file: file, line: line)
        send(level: .info, message: message, context: context)
    }

    public func warning(
        _ message: Any,
        function: String = #function,
        file: String = #file,
        line: Int = #line
    ) {
        let context = LogContext(function: function, file: file, line: line)
        send(level: .warning, message: message, context: context)
    }

    public func error(
        _ message: Any,
        function: String = #function,
        file: String = #file,
        line: Int = #line
    ) {
        let context = LogContext(function: function, file: file, line: line)
        send(level: .error, message: message, context: context)
    }
}

public class Logger: LoggerProtocol {
    var destinations = [LogDestinationProtocol]()

    public init() {}

    public func send(level: LogLevel, message: Any, context: LogContextProtocol) {
        destinations.forEach { logger in
            logger.write(message, level: level, context: context)
        }
    }

    public func register(destination: LogDestinationProtocol) {
        destinations.append(destination)
    }
}
