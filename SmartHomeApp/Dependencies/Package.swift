// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Dependencies",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Dependencies",
            targets: ["Dependencies"]),
    ],
    dependencies: [
        .package(path: "Animation"),
        .package(path: "Components"),
        .package(path: "Navigation"),
        .package(path: "DependencyInjection")
    ],
    targets: [
        .target(
            name: "Dependencies",
            dependencies: [
                .product(name: "Animation", package: "Animation"),
                .product(name: "Components", package: "Components"),
                .product(name: "Navigation", package: "Navigation"),
                .product(name: "DependencyInjection", package: "DependencyInjection")
            ]),
    ]
)
