// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let supportedPlatforms: [Platform] = [
    .macOS,
    .macCatalyst,
    .iOS,
    .watchOS,
    .tvOS,
    .linux,
    .windows
]

let package = Package(
    name: "OpenSwiftUI",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "OpenSwiftUI",
            targets: ["OpenSwiftUI"]),
    ],
    dependencies: [
         .package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.13.0"),
         .package(url: "https://github.com/yanagiba/swift-lint.git", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "OpenSwiftUI",
            dependencies: [
                "OpenCombine",
                "swift-lint"
            ]),
        .testTarget(
            name: "OpenSwiftUITests",
            dependencies: [ "OpenSwiftUI" ]),
    ],
    cxxLanguageStandard: .cxx17
)

// MARK: - Helpers

extension Array where Element == Platform {
    func except(_ exceptions: [Platform]) -> [Platform] {
        return filter { !exceptions.contains($0) }
    }
}
