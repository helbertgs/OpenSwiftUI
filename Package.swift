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
            targets: ["OpenSwiftUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OpenCombine/OpenCombine.git", branch: "master"),
        .package(url: "https://github.com/apple/swift-markdown.git", branch: "main"),
        .package(url: "https://github.com/compnerd/swift-win32.git", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", branch: "main"),
        .package(url: "https://github.com/Quick/Nimble", branch: "main"),
        .package(url: "https://github.com/Quick/Quick", branch: "main")
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
        .testTarget(
            name: "Unit",
            dependencies: [
                "OpenSwiftUI",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]),
        .testTarget(
            name: "Snapshot",
            dependencies: [
                "OpenSwiftUI",
                .product(name: "Nimble", package:"Nimble", condition: .when(platforms: [.macOS, .iOS])),
                .product(name: "Quick", package:"Quick", condition: .when(platforms: [.macOS, .iOS])),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing", condition: .when(platforms: [.macOS, .iOS]))
            ]),
    ],
    cxxLanguageStandard: .cxx20
)

// MARK: Helpers
extension Array where Element == Platform {
    func except(_ exceptions: [Platform]) -> [Platform] {
        return filter { !exceptions.contains($0) }
    }
}
