import ComposableArchitecture
import Models
import SwiftUI

public struct FavoritesState {
    public let language: Language
    public var favorites: [Language: [Word]]

    public init(
        language: Language,
        favorites: [Language: [Word]]
    ) {
        self.language = language
        self.favorites = favorites
    }
}

public enum FavoritesAction {
    case didTapWord(word: Word)
    case didTapRemoveWord(indexSet: IndexSet)
}

public func reducer(value: inout FavoritesState, action: FavoritesAction) -> [Effect<
    FavoritesAction
>] {
    switch action {
    case .didTapWord(let word):
        return [.print(message: "side effect on \(word.word)!")]
    case .didTapRemoveWord(let indexSet):
        var array = value.favorites[value.language]
        indexSet.forEach { array?.remove(at: $0) }
        value.favorites[value.language] = array
        return []
    }
}
