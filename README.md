# LoggerKit [![Build Status](https://travis-ci.com/ngtk/LoggerKit.svg?branch=master)](https://travis-ci.com/ngtk/LoggerKit)
🤖 LoggerKit is logging framework that provides a format, log levels and multiple output destinations.

## Usage
Using pre bundled logger class `Logger`, you can send log with log level like:

```swift
// Global context
let logger = Logger()
let stdout = StandardOut()
logger.register(destination: stdout)

// In some code
logger.debug("For debug")
logger.verbose("Something verbose")
logger.info("Something want to know")
logger.warning("Not expected, but not error")
logger.error("Something went wrong, fix this")
```

## Customize
You can register custom destinations and log format.
Log format is belongs to destination. So you can set format by each destination.

```swift
// Create your log formatter
final class CustomLogFormatter: LogFormatterProtocol {
    func format(message: Any, level: LogLevel, context: LogContextProtocol) -> String {
        // Format message here
    }
}

// Create you log destination
final class CustomLogDestination: LogDestinationProtocol {
    var formatter: LogFormatterProtocol

    init(formatter: LogFormatterProtocol = CustomLogFormatter()) {
        self.formatter = formatter
    }

    func write(_ message: Any, level: LogLevel, context: LogContextProtocol) {
        let formatted = formatter.format(message, level: level, context: context)
        // You can write here how you want
    }
}
```

## Installation
Using [CocoaPods](https://cocoapods.org/):

```
pod 'LoggerKit'
```

## Development
In order to create Xcode project, run:

```
$ swift package generate-xcodeproj
```
