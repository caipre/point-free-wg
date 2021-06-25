import ComposableArchitecture
import Models

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
        return [.print(message: "didTapTodaysWord")]
    case .didTapRecentlyViewed:
        return [.print(message: "didTapRecentlyViewed")]
    case .didTapFavorites:
        return [.print(message: "didTapFavorites")]
    case .didTapSearch(let query):
        return [.print(message: query)]
    }
}
