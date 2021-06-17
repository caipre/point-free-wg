import ComposableArchitecture
import Languages

public struct HomeState {
    public var language: Language

    public init(
        language: Language
    ) {
        self.language = language
    }

}

public enum HomeAction {
    case didTapLanguage(language: Language)
    case didTapTodaysWord
    case didTapRecentlyViewed
    case didTapFavorites
    case didTapSearch(query: String)
}


public func reducer(value: inout Language, action: HomeAction) -> [Effect<HomeAction>] {
    switch action {
    case .didTapLanguage(let language):
        value = language
        return []
    case .didTapTodaysWord:
        return [
            { _ in
                print("didTapTodaysWord")
            }
        ]
    case .didTapRecentlyViewed:
        return [
            { _ in
                print("didTapRecentlyViewed")
            }
        ]
    case .didTapFavorites:
        return [
            { _ in
                print("didTapFavorites")
            }
        ]
    case .didTapSearch(let query):
        return [
            { _ in
                print(query)
            }
        ]
    }
}
