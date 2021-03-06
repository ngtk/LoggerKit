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
        typealias SendClosure = ((_ level: LogLevel, _ message: Any, _ context: LogContextProtocol) -> Void)

        let sendClosure: SendClosure

        init(
            sendClosure: @escaping SendClosure
        ){
            self.sendClosure = sendClosure
        }

        func send(level: LogLevel, message: Any, context: LogContextProtocol) {
            sendClosure(level, message, context)
        }

        func willSend(level: LogLevel, message: Any, context: LogContextProtocol) {
        }

        func didSend(level: LogLevel, message: Any, context: LogContextProtocol) {
        }
    }

    func test_debug() {
        let someLogger = SomeLogger(sendClosure: { level, message, _ in
            XCTAssertTrue(level == .debug && String(message: message) == "message for debug")
        })
        someLogger.debug("message for debug")
    }
    
    func test_verbose() {
        let someLogger = SomeLogger(sendClosure: { level, message, _ in
            XCTAssertTrue(level == .verbose && String(message: message) == "message for verbose")
        })
        someLogger.verbose("message for verbose")
    }

    func test_info() {
        let someLogger = SomeLogger(sendClosure: { level, message, _ in
            XCTAssertTrue(level == .info && String(message: message) == "message for info")
        })
        someLogger.info("message for info", "")
    }

    func test_warning() {
        let someLogger = SomeLogger(sendClosure: { level, message, _ in
            XCTAssertTrue(level == .warning && String(message: message) == "message for warning")
        })
        someLogger.warning("message for warning")
    }

    func test_error() {
        let someLogger = SomeLogger(sendClosure: { level, message, _ in
            XCTAssertTrue(level == .error && String(message: message) == "message for error")
        })
        someLogger.error("message for error")
    }
}

private extension String {
    init?(message: Any) {
        guard let joined = (message as? Array<String>)?.joined() else { return nil }
        self.init(joined)
    }
}
