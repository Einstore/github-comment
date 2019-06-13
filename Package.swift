// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "app",
    products: [
        .executable(name: "github-comment", targets: ["GithubComment"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-alpha.1.2"),
        .package(url: "https://github.com/Einstore/GithubAPI.git", from: "1.0.2")
    ],
    targets: [
        .target(
            name: "GithubComment",
            dependencies: [
                "Vapor"
            ]
        )
    ]
)
