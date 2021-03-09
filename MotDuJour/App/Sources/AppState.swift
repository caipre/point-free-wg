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
    static let homeLens: Optics.Lens<AppState, HomeState> = Optics.Lens<AppState, HomeState>(
        get: { appState in HomeState(language: appState.currentLanguage) },
        set: { homeState, appState in appState.currentLanguage = homeState.language }
    )

    static let favoritesLens = Optics.Lens<AppState, FavoritesState>(
        get: { FavoritesState(language: $0.currentLanguage, favorites: $0.favorites) },
        set: { favorites, app in app.favorites = favorites.favorites }
    )

    static let wordLens = Optics.Lens<AppState, WordState>(
        get: { WordState(word: $0.wordToDefine, favorites: $0.favorites) },
        set: { word, app in app.favorites = word.favorites }
    )
}
