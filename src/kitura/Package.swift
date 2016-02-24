import PackageDescription

let package = Package(
    name: "kitura",

    dependencies: [
    	.Package(url: "https://github.com/IBM-Swift/Kitura-router.git", majorVersion: 0),
    ]
)
