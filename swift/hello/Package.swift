// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "Hello",
  products: [
    .executable(name: "hello", targets: ["hello"])
  ],
  dependencies: [],
  targets: [
    .target(name: "hello", dependencies: [])
  ]
)
