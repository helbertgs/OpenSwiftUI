// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let supportedPlatforms: [Platform] = [
    .macOS,
    .macCatalyst,
    .iOS,
    .watchOS,
    .tvOS,
    .windows
]

let package = Package(
    name: "OpenSwiftUI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "OpenSwiftUI",
            type: .dynamic,
            targets: ["OpenSwiftUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OpenCombine/OpenCombine.git", branch: "master"),
        .package(url: "https://github.com/apple/swift-markdown.git", branch: "main"),
        .package(url: "https://github.com/compnerd/swift-win32.git", branch: "main")
        // .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", branch: "main"),
        // .package(url: "https://github.com/Quick/Nimble", branch: "main"),
        // .package(url: "https://github.com/Quick/Quick", branch: "main")
    ],
    targets: [
        .target(
            name: "OpenSwiftUI",
            dependencies: [
                .product(name: "OpenCombine", package: "OpenCombine"),
                .product(name: "Markdown", package: "swift-markdown"),
                .product(name: "SwiftWin32", package: "swift-win32", condition: .when(platforms: [.windows]))
            ],
            exclude: [ ]),
        // .testTarget(
        //     name: "Unit",
        //     dependencies: [
        //         "Nimble",
        //         "OpenSwiftUI",
        //         "Quick"
        //     ]),
        // .testTarget(
        //     name: "Snapshot",
        //     dependencies: [
        //         "Nimble",
        //         "OpenSwiftUI",
        //         "Quick",
        //         .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
        //     ]),
    ],
    cxxLanguageStandard: .cxx20
)

// MARK: Helpers
extension Array where Element == Platform {
    func except(_ exceptions: [Platform]) -> [Platform] {
        return filter { !exceptions.contains($0) }
    }
}
