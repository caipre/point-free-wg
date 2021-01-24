import Foundation

/// Derived from [5000 Most Frequently Used French Words] Anki deck.
/// https://ankiweb.net/shared/info/893324022
struct French: Codable {

  let records: [Record]
  struct Record: Codable {
    /// The frequency index of the word (lower number indicates higher frequency)
    let index: Int

    /// The word in French, including its article
    let word: String

    /// The IPA representation of the word
    let ipa: String?

    /// The meaning of the word in English, including its part of speech
    let meaning: String

    /// Variations in the form of the word
    let declension: String?

    /// Examples of usage in French, including translation to English
    let examples: String?
  }
}
