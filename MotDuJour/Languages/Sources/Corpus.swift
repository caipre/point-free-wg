import Foundation

/// English derived from [The Oxford 5000 Most Important Words]
/// https://ankiweb.net/shared/info/231852910
/// French derived from [5000 Most Frequently Used French Words] Anki deck.
/// https://ankiweb.net/shared/info/893324022
public struct Corpus: Codable {

    public let records: [Record]

    public struct Record: Codable {
        /// The frequency index of the word (lower number indicates higher frequency)
        public let index: Int

        /// The word, including its article
        public let word: String

        /// The IPA representation of the word
        public let ipa: String?

        /// The meaning of the word in English, including its part of speech
        public let meaning: String

        /// Variations in the form of the word
        public let declension: String?

        /// Examples of usage, including translation to English
        public let examples: String?
    }
}
