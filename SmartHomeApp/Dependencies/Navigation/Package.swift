// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Navigation",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Navigation",
            targets: ["Navigation"]
        )
    ],
    dependencies: [
        .package(path: "../Design")
    ],
    targets: [
        .target(
            name: "Navigation",
            dependencies: [
                .product(name: "Design", package: "Design")
            ]
        )
    ]
)
