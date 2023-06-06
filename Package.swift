// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VariadicGenericsUtils",
    platforms: [.iOS(.v11), .macOS(.v10_13), .tvOS(.v11), .watchOS(.v4), .macCatalyst(.v13)],
    products: [
        .library(
            name: "VariadicGenericsUtils",
            targets: ["VariadicGenericsUtils"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "VariadicGenericsUtils",
            dependencies: [],
            swiftSettings: [.enableExperimentalFeature("VariadicGenerics")]
        ),
        .testTarget(
            name: "VariadicGenericsUtilsTests",
            dependencies: ["VariadicGenericsUtils"],
            swiftSettings: [.enableExperimentalFeature("VariadicGenerics")]
        )
    ]
)
