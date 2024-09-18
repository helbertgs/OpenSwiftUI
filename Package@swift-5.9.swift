// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenSwiftUI",
    products: [
        .library(
            name: "OpenSwiftUI",
            targets: ["OpenSwiftUI"]),
        .executable(
            name: "Sample",
            targets: ["Sample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OpenCombine/OpenCombine.git", branch: "master"),
        .package(url: "https://github.com/helbertgs/OpenGLAD", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenGLFW", branch: "main"),
    ],
    targets: [
        .target(
            name: "OpenSwiftUI",
            dependencies: [
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "OpenGLAD", package: "OpenGLAD"),
                .product(name: "OpenGLFW", package: "OpenGLFW")
            ]
        ),
        .executableTarget(
            name: "Sample",
            dependencies: ["OpenSwiftUI"],
            swiftSettings: [
                .unsafeFlags([ "-parse-as-library" ])
            ]
        )
    ]
)