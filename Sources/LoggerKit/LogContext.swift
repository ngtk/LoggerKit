public protocol LogContextProtocol {
    var function: String { get set }
    var file: String { get set }
    var line: Int { get set }
}

public struct LogContext: LogContextProtocol {
    public var function: String
    public var file: String
    public var line: Int
}
