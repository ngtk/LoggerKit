import XCTest
import LoggerKit

final class LogDestinationProtocolTests: XCTestCase {
    func test_write() {
        let destination = LogDestinationMock(didWrite: {(message, level, context) in
            XCTAssertTrue(
                "\(message)" == "some message for destination test"
                    && level == .info
                    && context.file == "File info"
                    && context.function == "Function info"
                    && context.line == 999
            )
        })
        destination.write("some message for destination test", level: .info, context: LogContextMock())
    }
}

final class LogFormatterMock: LogFormatterProtocol {
    typealias DidFormatClosure = ((_ message: Any, _ level: LogLevel, _ context: LogContextProtocol) -> Void)

    let didFormat: DidFormatClosure

    init(didFormat: @escaping DidFormatClosure) {
        self.didFormat = didFormat
    }

    func format(message: Any, level: LogLevel, context: LogContextProtocol) -> String {
        didFormat(message, level, context)
        return "\(message)"
    }
}

final class StandardOutTests: XCTestCase {
    func test_write() {
        let stdout = StandardOut()
        stdout.formatter = LogFormatterMock(didFormat: { message, level, context in
            XCTAssertTrue(
                "\(message)" == "stdout message"
                    && level == .info
                    && context.function == "Function info"
                    && context.file == "File info"
                    && context.line == 999
            )
        })
        stdout.write("stdout message", level: .info, context: LogContextMock())
    }
}
