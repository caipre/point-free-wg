import SwiftUI

struct Result: Hashable {
  let word: Word
  let score: Float
}

protocol Searcher {
  func search(query: String) -> [Result]
}

class SearcherImpl: Searcher {
  func search(query: String) -> [Result] {
    return [
      Result(word: query, score: 1),
      Result(word: query, score: 2),
    ]
  }
}
