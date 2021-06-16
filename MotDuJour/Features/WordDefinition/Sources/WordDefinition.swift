import ComposableArchitecture
import Foundation
import Models

public struct WordState {
    public let word: Word?
    public let favorites: [Language: [Word]]

    public init(
        word: Word?,
        favorites: [Language: [Word]]
    ) {
        self.word = word
        self.favorites = favorites
    }
}

public enum WordAction {
    case didTapFavorite
    case didTapWord
}

public func reducer(value: inout WordState, action: WordAction) -> [Effect<WordAction>] {
    switch action {
    case .didTapFavorite:
        return [
            {
                print("didTapFavorite")
                return .didTapWord
            }
        ]
    case .didTapWord:
        return [
            {
                print("didTapWord")
                return nil
            }
        ]
    }
}
