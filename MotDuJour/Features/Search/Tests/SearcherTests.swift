import Models
import XCTest

@testable import SearchFeature

class SearcherTests: XCTestCase {
    var sut: Searcher!
    override func setUp() {
    }

    func testThatItMatchesFuzzily() {
        sut = SearcherImpl(index: [Word("one"), Word("two"), Word("three")])
        let actual = sut.search(query: "o").map(\.word)
        let expected: [Word] = [Word("one"), Word("two")]
        XCTAssertEqual(actual, expected)
    }
}

extension Word {
    init(_ word: String) {
        self.init(word: word, language: .en)
    }
}
