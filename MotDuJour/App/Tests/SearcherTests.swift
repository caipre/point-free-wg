import Models
import XCTest

@testable import App

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
