// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Animation",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Animation",
            targets: ["Animation"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/airbnb/lottie-ios.git",
            exact: "4.2.0"
        )
    ],
    targets: [
        .target(
            name: "Animation",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios")
            ],
            resources: [
                .process("Resources/")
            ]
        )
    ]
)
