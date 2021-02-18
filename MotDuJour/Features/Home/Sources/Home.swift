import Models

public struct HomeState {
    private let language: Language

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
