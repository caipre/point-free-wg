import Models

public struct FavoritesState {
    public let language: Language
    public let favorites: [Language: [Word]]

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

public func reducer(value: inout FavoritesState, action: FavoritesAction) {
    switch action {
    case .didTapWord:
        print("didTapWord")
    case .didTapRemoveWord:
        print("didTapRemoveWord")
    }
}
