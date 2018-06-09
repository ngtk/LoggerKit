import LoggerKit

final class LogDestinationMock: LogDestinationProtocol {
    typealias DidWriteClosure = ((_ message: Any, _ level: LogLevel, _ context: LogContextProtocol) -> Void)

    let didWrite: DidWriteClosure

    init(didWrite: @escaping DidWriteClosure) {
        self.didWrite = didWrite
    }

    func write(_ message: Any, level: LogLevel, context: LogContextProtocol) {
        didWrite(message, level, context)
    }
}
