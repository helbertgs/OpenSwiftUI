// swift-tools-version: 6.3
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
        .package(url: "https://github.com/helbertgs/OpenFreeType", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenGLAD", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenGLFW", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenSpatial", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenSTB", branch: "main"),

        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0"),
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.54.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.53.0"),
    ],
    targets: [
        .target(
            name: "OpenSwiftUI",
            dependencies: [
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "OpenFreeType", package: "OpenFreeType"),
                .product(name: "OpenGLAD", package: "OpenGLAD"),
                .product(name: "OpenGLFW", package: "OpenGLFW"),
                .product(name: "OpenHarfBuzz", package: "OpenFreeType"),
                .product(name: "OpenSpatial", package: "OpenSpatial"),
                .product(name: "OpenSTB", package: "OpenSTB"),
            ],
            plugins: [
                // .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")
            ]
        ),
        .testTarget(
            name: "OpenSwiftUITests",
            dependencies: ["OpenSwiftUI"]
        ),
        .executableTarget(
            name: "OpenSwiftUISample",
            dependencies: ["OpenSwiftUI"],
            swiftSettings: [
                .unsafeFlags([ "-parse-as-library" ])
            ],
            plugins: [
                // .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")
            ]
        )
    ]
)

#if os(macOS)
    package.platforms = [.macOS(.v15)]
#endif