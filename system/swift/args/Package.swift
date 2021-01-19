// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Args",
    products: [
        .executable(name: "args", targets: ["args"])
    ],
    dependencies: [],
    targets: [
        .target(name: "args", dependencies: [])
    ]
)
