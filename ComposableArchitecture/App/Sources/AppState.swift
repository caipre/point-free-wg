struct AppState {
    var todaysWord: EnglishWord

    var recents: [EnglishWord]
    var favorites: [EnglishWord]

    var currentLanguage: Language
    var searchQuery: String
    var searchResults: [EnglishWord]
}

typealias EnglishWord = String

enum Language {
    case en
    case jp
    case fr
}
