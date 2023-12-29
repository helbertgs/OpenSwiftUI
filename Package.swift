// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenSwiftUI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
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
        .package(url: "https://github.com/apple/swift-markdown.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "OpenSwiftUI",
            dependencies: [
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "Markdown", package: "swift-markdown")
            ]
        ),
        .executableTarget(
            name: "Sample",
            dependencies: ["OpenSwiftUI"],
            swiftSettings: [
                .unsafeFlags([ "-parse-as-library" ], .when(platforms: [.windows]))]
        )
    ]
)

#if os(Windows)
    package
        .dependencies += [
            .package(url: "https://github.com/helbertgs/swift-win32.git", branch: "main"),
            .package(url: "https://github.com/pvieito/PythonKit.git", branch: "master"),
        ]

    package
        .targets
        .first { $0.name == "OpenSwiftUI" }?
        .dependencies += [
            .product(name: "SwiftWin32", package: "swift-win32"),
            .product(name: "PythonKit", package: "PythonKit"),
        ]
#endif
