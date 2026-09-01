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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "5.0.0-beta.5"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXSuperApp.git", exact: "5.0.0-beta.5")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperAppSandbox-5.0.0-beta.5.xcframework.zip",
			checksum: "732689df4f55a1f80dc20b44d47c278c49991befa5fa7152ae14f5cc42897c21"
		)
	]
)