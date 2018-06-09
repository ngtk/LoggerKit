import XCTest
import LoggerKit

final class LoggerTests: XCTestCase {
    func test_send() {
        let logger = Logger()
        let destination = LogDestinationMock(didWrite: { (message, level, context) in
            XCTAssertTrue(
                "\(message)" == "Awesome message"
                && level == .info
                && context.function == "Function info"
                && context.file == "File info"
                && context.line == 999
            )
        })
        logger.register(destination: destination)
        logger.send(level: .info, message: "Awesome message", context: LogContextMock())
    }
}


final class LoggerProtocolTests: XCTestCase {
    final class SomeLogger: LoggerProtocol {
        typealias DidSendClosure = ((_ level: LogLevel, _ message: Any, _ context: LogContextProtocol) -> Void)

        let didSend: DidSendClosure

        init(didSend: @escaping DidSendClosure) {
            self.didSend = didSend
        }

        func send(level: LogLevel, message: Any, context: LogContextProtocol) {
            didSend(level, message, context)
        }
    }

    func test_debug() {
        let someLogger = SomeLogger(didSend: { level, message, _ in
            XCTAssertTrue(level == .debug && "\(message)" == "message for debug")
        })
        someLogger.debug("message for debug")
    }
    
    func test_verbose() {
        let someLogger = SomeLogger(didSend: { level, message, _ in
            XCTAssertTrue(level == .verbose && "\(message)" == "message for verbose")
        })
        someLogger.verbose("message for verbose")
    }

    func test_info() {
        let someLogger = SomeLogger(didSend: { level, message, _ in
            XCTAssertTrue(level == .info && "\(message)" == "message for info")
        })
        someLogger.info("message for info")
    }

    func test_warning() {
        let someLogger = SomeLogger(didSend: { level, message, _ in
            XCTAssertTrue(level == .warning && "\(message)" == "message for warning")
        })
        someLogger.warning("message for warning")
    }

    func test_error() {
        let someLogger = SomeLogger(didSend: { level, message, _ in
            XCTAssertTrue(level == .error && "\(message)" == "message for error")
        })
        someLogger.error("message for error")
    }

}
