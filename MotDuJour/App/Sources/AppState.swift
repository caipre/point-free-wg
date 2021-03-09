import ComposableArchitecture
import FavoritesFeature
import HomeFeature
import Models
import WordDefinitionFeature

struct AppState {
    var todaysWord: (Word, Language) = ("default", .en)

    var recents: [Language: [Word]] = [:]
    var favorites: [Language: [Word]] = [:]

    var currentLanguage: Language = .en

    var search: Search = Search.empty

    var wordToDefine: Word?
}

struct Search {
    var query: String
    var results: [Word]

    static var empty: Search {
        Search(query: "", results: [])
    }
}

// MARK: - Optics
extension AppState {
    static let homeLens: Optics.Lens<AppState, Language> = Optics.Lens<AppState, Language>(
        get: { $0.currentLanguage },
        set: { $1.currentLanguage = $0 }
    )

    static let favoritesLens = Optics.Lens<AppState, FavoritesState>(
        get: { FavoritesState(language: $0.currentLanguage, favorites: $0.favorites) },
        set: { favorites, app in app.favorites = favorites.favorites }
    )

    static let recentsLens = Optics.Lens<AppState, [Language: [Word]]>(
        get: { $0.recents },
        set: { $1.recents = $0 }
    )

    static let wordLens = Optics.Lens<AppState, WordState>(
        get: { WordState(word: $0.wordToDefine, favorites: $0.favorites) },
        set: { word, app in app.favorites = word.favorites }
    )
}
