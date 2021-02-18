import Models

public struct FavoritesState {
    let language: Language
    let favorites: [Language: [Word]]

    public init(
        language: Language,
        favorites: [Language: [Word]]
    ) {
        self.language = language
        self.favorites = favorites
    }
}

public enum FavoritesAction {
    case didTapWord
    case didTapRemoveWord
}
