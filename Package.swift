// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXSuperAppSandbox",
	platforms: [.iOS("13.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXSuperAppSandbox",
			targets: ["GXSuperAppSandboxWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.2.0-beta.24"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXSuperApp.git", exact: "2.2.0-beta.24")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperAppSandbox-2.2.0-beta.24.xcframework.zip",
			checksum: "850193d6a1299b373d22914126ee53292c92c7313c386a7573f9f603af1f76d4"
		)
	]
)