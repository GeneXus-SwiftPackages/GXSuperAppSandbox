// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXSuperAppSandbox",
	platforms: [.iOS("12.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXSuperAppSandbox",
			targets: ["GXSuperAppSandboxWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.2.0-beta.11"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXSuperApp.git", exact: "2.2.0-beta.11")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperAppSandbox-2.2.0-beta.11.xcframework.zip",
			checksum: "e2dbbadae339c128f16abdbcca7225bb1483e18c90f80baf327c0b84a185e609"
		)
	]
)