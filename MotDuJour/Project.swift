import ProjectDescription

let base = SettingsDictionary()
    .swiftVersion("5.3")
    .swiftCompilationMode(.wholemodule)

let infop: InfoPlist = .extendingDefault(with: [
    "UILaunchStoryboardName": "LaunchScreen",
    "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate",
                ]
            ]
        ],
    ],
])

let p = Project(
    name: "MotDuJour",
    packages: [
        .package(url: "https://github.com/khoi/fuzzy-swift", from: "0.1.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "8.0.0"),
        .package(url: "https://github.com/Quick/Quick", from: "3.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.1.2"),
    ],
    settings: Settings(base: base),
    targets: [
        Target(
            name: "App",
            platform: .iOS,
            product: .app,
            bundleId: "pointfree.motdujour",
            infoPlist: infop,
            sources: ["App/Sources/**"],
            resources: ["App/Resources/**"],
            dependencies: [
                .package(product: "CasePaths"),
                .package(product: "Fuzzy"),
                .target(name: "HomeFeature"),
                .target(name: "FavoritesFeature"),
                .target(name: "Models"),
                .target(name: "ComposableArchitecture"),
            ]
        ),
        Target(
            name: "AppTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "pointfree.motdujour",
            infoPlist: .default,
            sources: ["App/Tests/**"],
            resources: ["App/Resources/**"],
            dependencies: [.target(name: "App")]
        ),

        // features
        Feature("Home"),
        Feature("Favorites"),

        // libraries
        Target(
            name: "Models",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "pointfree.motdujour",
            infoPlist: .default,
            sources: ["Models/Sources/**"]
        ),

        Target(
            name: "ComposableArchitecture",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "pointfree.motdujour",
            infoPlist: .default,
            sources: ["ComposableArchitecture/Sources/**"],
            dependencies: [
                .package(product: "CasePaths")
            ]
        ),
        Target(
            name: "ComposableArchitectureTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "pointfree.motdujour",
            infoPlist: .default,
            sources: ["ComposableArchitecture/Tests/**"],
            dependencies: [
                .package(product: "CasePaths"),
                .target(name: "ComposableArchitecture"),
            ]
        ),
    ],
    additionalFiles: [
        "Project.swift"
    ]
)

func Feature(_ name: String, dependencies: [TargetDependency] = []) -> Target {
    let sources: SourceFilesList = ["Features/\(name)/Sources/**"]
    let resources: [FileElement] = ["Features/\(name)/Resources/**"]
    var dependencies = dependencies
    dependencies.append(contentsOf: [
        .package(product: "CasePaths"),
        .target(name: "ComposableArchitecture"),
        .target(name: "Models"),
    ])
    return Target(
        name: name.appending("Feature"),
        platform: .iOS,
        product: .staticFramework,
        bundleId: "pointfree.motdujour",
        infoPlist: .default,
        sources: sources,
        resources: resources,
        dependencies: dependencies
    )
}
