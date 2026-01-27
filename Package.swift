// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(macOS)
let branch = "macos"
#else
let branch = "main"
#endif

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
        .package(url: "https://github.com/helbertgs/OpenGLAD", branch: branch),
        .package(url: "https://github.com/helbertgs/OpenGLFW", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenSpatial", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenSTB", branch: "main"),
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: "OpenSwiftUI",
            dependencies: [
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "OpenGLAD", package: "OpenGLAD"),
                .product(name: "OpenGLFW", package: "OpenGLFW"),
                .product(name: "OpenSpatial", package: "OpenSpatial"),
                .product(name: "OpenSTB", package: "OpenSTB"),
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

#if os(macOS)
    package.platforms = [.macOS(.v15)]
#endif