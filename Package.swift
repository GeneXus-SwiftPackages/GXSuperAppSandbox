// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXSuperAppSandbox",
	platforms: [.iOS("12.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXSuperAppSandbox",
			targets: ["GXSuperAppSandboxWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.1.0-beta.794"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXSuperApp.git", exact: "1.1.0-beta.794")
	],
	targets: [
		.target(name: "GXSuperAppSandboxWrapper",
				dependencies: [
					"GXSuperAppSandbox",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXSuperApp", package: "GXSuperApp", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXSuperAppSandbox",
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperAppSandbox-1.1.0-beta.794.xcframework.zip",
			checksum: "4fed811586f3768f05c0bb3105c1ae6a25f8cb39b1993433d2b05a057ca4c0bb"
		)
	]
)