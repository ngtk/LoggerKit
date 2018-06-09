// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "LoggerKit",
    products: [
        .library(
            name: "LoggerKit",
            targets: ["LoggerKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "LoggerKit",
            dependencies: []),
        .testTarget(
            name: "LoggerKitTests",
            dependencies: ["LoggerKit"]),
    ]
)
