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
  name: "ComposableArchitecture",
  packages: [
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
      bundleId: "pointfree.composablearchitecture",
      infoPlist: infop,
      sources: ["App/Sources/**"],
      resources: ["App/Resources/**"],
      dependencies: [
        .package(product: "CasePaths")
      ]
    ),
    Target(
      name: "AppTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "pointfree.composablearchitecture",
      infoPlist: .default,
      sources: ["App/Tests/**"],
      resources: ["App/Resources/**"],
      dependencies: [.target(name: "App")]
    ),
  ],
  additionalFiles: [
    "Project.swift"
  ]
)
