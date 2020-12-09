import ProjectDescription

let setup = Setup([
  .homebrew(packages: ["swift-format", "swiftlint"]),
  .custom(
    name: "git hooks",
    meet: ["./scripts/install-hooks.sh"],
    isMet: ["./scripts/install-hooks.sh", "check"]
  ),
])
