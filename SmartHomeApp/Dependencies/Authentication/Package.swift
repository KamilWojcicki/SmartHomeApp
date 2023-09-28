// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Authentication",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Authentication",
            targets: ["Authentication"]
        )
    ],
    dependencies: [
        .package(path: "../Components"),
        .package(path: "../DependencyInjection"),
        .package(path: "../Navigation"),
        .package(path: "../Design"),
        .package(
            url: "https://github.com/facebook/facebook-ios-sdk.git",
            .upToNextMajor(from: "14.0.0")
            
        ),
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            .upToNextMajor(from: "10.0.0")
        ),
        .package(
            url: "https://github.com/google/GoogleSignIn-iOS.git",
            .upToNextMajor(from: "7.0.0")
        )
    ],
    targets: [
        .target(
            name: "Authentication",
            dependencies: [
                .product(name: "Components", package: "Components"),
                .product(name: "DependencyInjection", package: "DependencyInjection"),
                .product(name: "Navigation", package: "Navigation"),
                .product(name: "Design", package: "Design"),
                .product(name: "FacebookLogin", package: "facebook-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
                
            ]
        )
    ]
)
