// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "SRTHaishinKit",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "SRTHaishinKit", targets: ["SRTHaishinKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/mat2uken/HaishinKit.swift.git", branch: "v1.5-ae"),
    ],
    targets: [
        .binaryTarget(
            name: "libsrt",
            path: "Vendor/SRT/libsrt.xcframework"
        ),
        .target(name: "SRTHaishinKit",
                dependencies: [
                    "libsrt",
                    .product(name: "HaishinKit", package: "haishinkit.swift"),
                ],
                path: "Sources",
                sources: [
                    "Extension",
                    "SRT",
                    "Util",
                ]),
    ]
)

