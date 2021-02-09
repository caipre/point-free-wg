import Fuzzy

struct Result: Hashable {
  let word: Word
}

protocol Searcher {
  func search(query: String) -> [Result]
}

class SearcherImpl: Searcher {
  private let index: [Word]

  init(index: [Word] = []) {
    self.index = index
  }

  func search(query: String) -> [Result] {
    let matches =
      index
      .filter { Fuzzy.search(needle: query, haystack: $0) }
      .prefix(25)  // performance optimization
      .map { Result(word: $0) }
    return matches
  }
}
