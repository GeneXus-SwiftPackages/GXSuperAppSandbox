// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXSuperAppSandbox",
	platforms: [.iOS("15.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXSuperAppSandbox",
			targets: ["GXSuperAppSandboxWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.0.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXSuperApp.git", exact: "4.0.6")
	],
	targets: [
		.target(name: "GXSuperAppSandboxWrapper",
				dependencies: [
					"GXSuperAppSandbox",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS, .visionOS])),
					.product(name: "GXSuperApp", package: "GXSuperApp", condition: .when(platforms: [.iOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXSuperAppSandbox",
			url: "https://pkgs.genexus.dev/iOS/releases/GXSuperAppSandbox-4.0.6.xcframework.zip",
			checksum: "e59178c37eddd8c6e85b163d638a4fb4709e005aabb5cb4adca27c764020c4bf"
		)
	]
)