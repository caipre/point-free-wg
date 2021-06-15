import CasePaths
import Foundation

/// An optic is "a composable notion of substructure." There are many types of
/// optics; here we declare the protocols for two common optics that we will
/// make use of throughout the ComposableArchitecture. A Lens describes how to
/// transform a superstructure into its component parts (and back again). A
/// Prism distinguishes a particular case from its variants (and back again).
/// https://hackage.haskell.org/package/optics-0.1/docs/Optics.html
public enum Optics {
    // The Swift compiler provides Lenses for structs as KeyPaths
    public struct Lens<GlobalValue, LocalValue> {
        public let get: (GlobalValue) -> LocalValue
        public let set: (LocalValue, inout GlobalValue) -> Void

        public init(
            get: @escaping (GlobalValue) -> LocalValue,
            set: @escaping (LocalValue, inout GlobalValue) -> Void
        ) {
            self.get = get
            self.set = set
        }
    }

    // The CasePaths library provides Prisms for enums via reflection
    public struct Prism<GlobalAction, LocalAction> {
        public let extract: (GlobalAction) -> LocalAction?
        public let embed: (LocalAction) -> GlobalAction

        public init(
            extract: @escaping (GlobalAction) -> LocalAction?,
            embed: @escaping (LocalAction) -> GlobalAction
        ) {
            self.extract = extract
            self.embed = embed
        }
    }
}

public enum Pullback {
    public static func pullback<LocalValue, LocalAction, GlobalValue, GlobalAction>(
        reducer: @escaping Reducer<LocalValue, LocalAction>,
        lens: WritableKeyPath<GlobalValue, LocalValue>,
        prism: CasePath<GlobalAction, LocalAction>
    ) -> Reducer<GlobalValue, GlobalAction> {
        return { global, action in
            guard let localAction = prism.extract(from: action) else { return {} }
            let effect = reducer(&global[keyPath: lens], localAction)
            return effect
        }
    }

    public static func pullback<LocalValue, LocalAction, GlobalValue, GlobalAction>(
        reducer: @escaping Reducer<LocalValue, LocalAction>,
        lens: Optics.Lens<GlobalValue, LocalValue>,
        prism: Optics.Prism<GlobalAction, LocalAction>
    ) -> Reducer<GlobalValue, GlobalAction> {
        return { global, action in
            guard let localAction = prism.extract(action) else { return {} }
            var next = lens.get(global)
            return reducer(&next, localAction)
        }
    }
}
