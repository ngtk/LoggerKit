import XCTest
import LoggerKit

final class DefaultLogFormatterTests: XCTestCase {
    func test_format() {
        let formatter = DefaultLogFormatter()
        let formatted = formatter.format(message: "some message", level: .info, context: LogContextMock())

        XCTAssertTrue(
            match(target: formatted, regrexPattern: "\\A\\d\\d:\\d\\d:\\d\\d\\+\\d\\d:\\d\\d \\[INFO\\] some message\\z")
        )
    }
}

// Helpers
func match(target: String, regrexPattern: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: regrexPattern)
    let num = regex.numberOfMatches(in: target, options: [], range: NSRange(location: 0, length: target.count))
    return num > 0
}
