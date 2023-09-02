// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorAutoGen",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(
            name: "color-autogen",
            targets: ["ColorAutoGen"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/johnsundell/files.git",
            from: "4.0.0"
        ),
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            from: "1.0.1"
        )
    ],
    targets: [
        .target(
            name: "ColorAutoGen",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Files", package: "files"),
            ],
            resources: [.process("Template/Color+.txt"),
                        .process("Template/ColorKey.txt"),
                        .process("Template/ColorTests.txt"),
                        .process("Template/UIColor+.txt")]),
        .testTarget(
            name: "ColorAutoGenTests",
            dependencies: ["ColorAutoGen"]),
    ]
)
