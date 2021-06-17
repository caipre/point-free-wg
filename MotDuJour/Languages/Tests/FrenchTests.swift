import XCTest

@testable import Languages

class CorpusTests: XCTestCase {
    var decoder: JSONDecoder!

    override func setUp() {
        decoder = JSONDecoder()
    }

    func testThatFrenchIsDecodable() {
        let fr = Loaders.load(type: Corpus.self, resource: "fr.json")
        XCTAssert(!fr.records.isEmpty)
    }
}
