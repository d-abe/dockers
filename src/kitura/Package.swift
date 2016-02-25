import PackageDescription

let package = Package(
    name: "kitura",

    dependencies: [
    	.Package(url: "https://github.com/IBM-Swift/Kitura-router.git", majorVersion: 0),
    ],
    testDependencies: [
        .Package(url: "https://github.com/kylef/spectre-build.git", majorVersion: 0),
    ]
)
