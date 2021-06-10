import ComposableArchitecture
import FavoritesFeature
import HomeFeature
import Models
import WordDefinitionFeature

struct AppState: Codable {
    var todaysWord = Word(word: "default", language: Language.en)

    var favorites: [Language: [Word]] = [:]

    var currentLanguage: Language = .en

    var search: Search = Search.empty

    var wordToDefine: Word?
}

struct Search: Codable {
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

    static let wordLens = Optics.Lens<AppState, WordState>(
        get: { WordState(word: $0.wordToDefine, favorites: $0.favorites) },
        set: { word, app in app.favorites = word.favorites }
    )
}

extension AppState {
    var homeState: HomeState {
        get {
            HomeState(language: self.currentLanguage)
        }
        set {
            self.currentLanguage = newValue.language
        }
    }

    var favoritesState: FavoritesState {
        get {
            FavoritesState(language: self.currentLanguage, favorites: self.favorites)
        }
        set {
            self.currentLanguage = newValue.language
            self.favorites = newValue.favorites
        }
    }

    var wordState: WordState {
        get {
            WordState(word: self.wordToDefine, favorites: self.favorites)
        }
        set {
            self.wordToDefine = newValue.word
            self.favorites = newValue.favorites
        }
    }
}
