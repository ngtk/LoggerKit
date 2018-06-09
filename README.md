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
