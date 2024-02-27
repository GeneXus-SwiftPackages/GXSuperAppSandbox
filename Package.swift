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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.5.0-beta.8"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXSuperApp.git", exact: "1.5.0-beta.8")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperAppSandbox-1.5.0-beta.8.xcframework.zip",
			checksum: "4ffd8d514d9079f5c432bf1f795fd9733ef009e97677a547553c2f2f651ea4e4"
		)
	]
)