// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let supportedPlatforms: [Platform] = [
    .macOS,
    .iOS,
    .watchOS,
    .tvOS,
    .linux,
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
         .package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.13.0")
    ],
    targets: [
        .target(
            name: "OpenSwiftUI",
            dependencies: [ "OpenCombine" ]),
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
