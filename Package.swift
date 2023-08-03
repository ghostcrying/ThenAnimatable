// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "ThenAnimatable",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "ThenAnimatable", targets: ["ThenAnimatable"])
    ],
    targets: [
        .target(
            name: "ThenAnimatable",
            path: "Sources"
        ),
        .testTarget(
            name: "ThenAnimatableTests",
            dependencies: ["ThenAnimatable"],
            path: "ThenAnimatableTests"
        )
    ]
)
