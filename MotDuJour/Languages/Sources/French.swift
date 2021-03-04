import Foundation

/// Derived from [5000 Most Frequently Used French Words] Anki deck.
/// https://ankiweb.net/shared/info/893324022
public struct French: Codable {

    public let records: [Record]
    
    public struct Record: Codable {
        /// The frequency index of the word (lower number indicates higher frequency)
        public let index: Int

        /// The word in French, including its article
        public let word: String

        /// The IPA representation of the word
        public let ipa: String?

        /// The meaning of the word in English, including its part of speech
        public let meaning: String

        /// Variations in the form of the word
        public let declension: String?

        /// Examples of usage in French, including translation to English
        public let examples: String?
    }
}
