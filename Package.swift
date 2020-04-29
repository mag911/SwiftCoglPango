// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "CoglPango",
    products: [
        .library(name: "CoglPango", targets: ["CoglPango"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mag911/SwiftPango.git", .branch("master")),
        .package(url: "https://github.com/mag911/SwiftCogl.git", .branch("master")),
    ],
    targets: [
	.systemLibrary(name: "CCoglPango", pkgConfig: "cogl-pango cogl-1.0 cogl-gl-1.0 cogl-path-1.0 pango pangoft2 cairo glib-2.0 gio-unix-2.0",
	    providers: [
		.brew(["cogl", "cairo", "glib", "glib-networking", "gobject-introspection"]),
		.apt(["libcogl-pango-dev", "libcogl-gles2-dev", "libcogl-path-dev", "libcogl-dev", "libcairo2-dev", "libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
	    ]),
        .target(name: "CoglPango", dependencies: ["CCoglPango", "Cogl", "Pango"]),
        .testTarget(name: "CoglPangoTests", dependencies: ["CoglPango"]),
    ]
)
