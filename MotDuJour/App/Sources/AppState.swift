import Models

struct AppState {
    var todaysWord: (Word, Language) = ("default", .en)

    var recents: [Language: [Word]] = [:]
    var favorites: [Language: [Word]] = [:]

    var currentLanguage: Language = .en

    var search: Search = Search.empty
}

struct Search {
    var query: String
    var results: [Word]

    static var empty: Search {
        Search(query: "", results: [])
    }
}
