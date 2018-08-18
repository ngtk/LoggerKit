# LoggerKit [![Pod version](https://badge.fury.io/co/LoggerKit.svg)](https://badge.fury.io/co/LoggerKit) [![Build Status](https://travis-ci.com/ngtk/LoggerKit.svg?branch=master)](https://travis-ci.com/ngtk/LoggerKit) [![Maintainability](https://api.codeclimate.com/v1/badges/a87a4b6a431ee7a4d95c/maintainability)](https://codeclimate.com/github/ngtk/LoggerKit/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/a87a4b6a431ee7a4d95c/test_coverage)](https://codeclimate.com/github/ngtk/LoggerKit/test_coverage)
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
Log format belongs to destination. So you can set format by each destination.

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

### Release
```
$ edit LoggerKit.podspec
# set the new version to 0.0.1
# set the new tag to 0.0.1
$ pod lib lint

$ git add -A && git commit -m "Release 0.0.1."
$ git tag '0.0.1'
$ git push --tags
```

[CocoaPods Guides](https://guides.cocoapods.org/making/making-a-cocoapod.html#release)
