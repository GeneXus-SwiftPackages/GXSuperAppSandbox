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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.2.0-beta.11"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXSuperApp.git", exact: "1.2.0-beta.11")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperAppSandbox-1.2.0-beta.11.xcframework.zip",
			checksum: "477d7cf0fc8d65fe7cd5be76e7992b61cbef7c016257859acd91d82cfc364d85"
		)
	]
)