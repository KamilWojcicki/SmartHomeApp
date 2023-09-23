// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "DependencyInjection",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DependencyInjection",
            targets: ["DependencyInjection"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DependencyInjection"
        )
    ]
)
