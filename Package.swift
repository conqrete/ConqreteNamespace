// swift-tools-version: 5.6

import PackageDescription

let frameworkName: String = "ConqreteNamespace"
let frameworkTestsName: String = "\(frameworkName)Tests"

let package = Package(
    name: frameworkName,
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: frameworkName,
            targets: [frameworkName]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: frameworkName,
            dependencies: [],
            path: "\(frameworkName)/Sources/",
            exclude: ["SupportFiles/Info.plist"]
        ),
        .testTarget(
            name: frameworkTestsName,
            dependencies: [frameworkName],
            path: "\(frameworkTestsName)/Sources/"
        )
    ]
)