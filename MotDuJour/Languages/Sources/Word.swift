public struct Word: Codable, Hashable {
    public let word: String
    public let language: Language

    public init(word: String, language: Language) {
        self.word = word
        self.language = language
    }
}
