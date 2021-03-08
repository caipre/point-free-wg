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

public func reducer(value: inout WordState, action: WordAction) {
    switch action {
    case .didTapFavorite:
        print("didTapFavorite")
    case .didTapWord:
        print("didTapWord")
    }
}
