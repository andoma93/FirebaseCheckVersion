// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirebaseCheckVersion",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FirebaseCheckVersion",
            targets: ["FirebaseCheckVersion"]),
    ],
    platforms: [
        .iOS(.v13)
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Firebase",
                 url: "https://github.com/firebase/firebase-ios-sdk.git",
                 .upToNextMajor(from: "10.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FirebaseCheckVersion",
            dependencies: [.product(name: "FirebaseRemoteConfig", package: "Firebase")]),
        .testTarget(
            name: "FirebaseCheckVersionTests",
            dependencies: ["FirebaseCheckVersion"]),
    ]
)
