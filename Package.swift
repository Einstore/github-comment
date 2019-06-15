// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "app",
    products: [
        .executable(name: "github-comment", targets: ["GithubComment"]),
    ],
    dependencies: [
        // .package(url: "https://github.com/Einstore/GitHubKit.git", from: "1.2.2")
        .package(url: "https://github.com/vapor/swift-nio-http-client.git", from: "0.0.0")
    ],
    targets: [
        .target(
            name: "GithubComment",
            dependencies: [
                "GitHubKit"
            ]
        ),
        .target(
            name: "GitHubKit",
            dependencies: [
                "NIOHTTPClient"
            ]
        )
    ]
)

