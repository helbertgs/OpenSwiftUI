// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenSwiftUI",
    products: [
        .library(
            name: "OpenSwiftUI",
            targets: ["OpenSwiftUI"]),
        .executable(
            name: "OpenSwiftUISample",
            targets: ["OpenSwiftUISample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OpenCombine/OpenCombine.git", branch: "master"),
        .package(url: "https://github.com/helbertgs/AppKit.git", branch: "main"),
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", branch: "main")
    ],
    targets: [
        .target(
            name: "OpenSwiftUI",
            dependencies: [
                .product(name: "AppKit", package: "AppKit"),
                .product(name: "OpenCombine", package: "OpenCombine")
            ]
        ),
        .executableTarget(
            name: "OpenSwiftUISample",
            dependencies: ["OpenSwiftUI"],
            swiftSettings: [
                .unsafeFlags([ "-parse-as-library" ])
            ]
        )
    ]
)
