import Models
import XCTest

@testable import SearchFeature

class SearcherTests: XCTestCase {
    var sut: Searcher!
    override func setUp() {
    }

    func testThatItMatchesFuzzily() {
        sut = SearcherImpl(index: ["one", "two", "three"])
        let actual = sut.search(query: "o").map(\.word)
        let expected: [Word] = ["one", "two"]
        XCTAssertEqual(actual, expected)
    }
}

extension Word: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(word: value, language: Language.en)
    }
}
