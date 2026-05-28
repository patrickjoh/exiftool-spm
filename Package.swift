// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ExifToolSPM",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ExifTool",
            targets: [
                "ExifTool"
            ]
        )
    ],
    targets: [
        .binaryTarget(
            name: "CExifToolBridge",
            url: "https://github.com/lbr77/exiftool-spm/releases/download/v13.59-perl-5.40.3/CExifToolBridge.xcframework.zip",
            checksum: "4ce596e63a80343cf2d31e3bb32e0ea1101dd91e3e26aa9865c49f279636f849"
        ),
        .target(
            name: "ExifTool",
            dependencies: [
                "CExifToolBridge"
            ],
            path: "Sources/ExifTool",
            resources: [
                .copy("Resources/Perl")
            ]
        ),
        .testTarget(
            name: "ExifToolTests",
            dependencies: [
                "ExifTool"
            ],
            path: "Tests/ExifToolTests"
        )
    ]
)
