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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.2.0-beta.18"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXSuperApp.git", exact: "4.2.0-beta.18")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperAppSandbox-4.2.0-beta.18.xcframework.zip",
			checksum: "540424289ee766ff66060cea42912e3a3efd8b97f857fb28c17974c14a606100"
		)
	]
)