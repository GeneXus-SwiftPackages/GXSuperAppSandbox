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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230630183632"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXSuperApp.git", exact: "1.0.0-beta.20230630183632")
	],
	targets: [
		.target(name: "GXSuperAppSandboxWrapper",
				dependencies: [
					"GXSuperAppSandbox",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXSuperApp", package: "GXSuperApp", condition: .when(platforms: [.tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXSuperAppSandbox",
			url: "https://pkgs.genexus.dev/iOS/beta/GXSuperAppSandbox-1.0.0-beta.20230630183632.xcframework.zip",
			checksum: "08da737d12959a1861704db12617b2c599c11461f9c6eadec109d123d08720be"
		)
	]
)