// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Prelude",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Prelude",
            targets: ["Prelude"]),
    ],
    targets: [
        .target(
            name: "Prelude",
            dependencies: []),
        .testTarget(
            name: "PreludeTests",
            dependencies: ["Prelude"]),
    ]
)
