import LoggerKit

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
