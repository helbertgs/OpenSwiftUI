// swift-tools-version: 6.1
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
        .package(url: "https://github.com/helbertgs/OpenSpatial", branch: "main"),
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", branch: "main")
    ],
    targets: [
        .target(
            name: "OpenSwiftUI",
            dependencies: [
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "OpenSpatial", package: "OpenSpatial")
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
