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
        let print = Effect<WordAction>.print(message: "didTapFavorite")
        let save = Effect<WordAction>.save()
        let chained = print.then(save)
        let combined = chained.map { a1, a2 -> WordAction in
            return a1
        }
        return [combined]
    case .didTapWord:
        return [.print(message: "didTapWord")]
    }
}
