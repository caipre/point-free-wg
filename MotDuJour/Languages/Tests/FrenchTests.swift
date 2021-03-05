import XCTest

@testable import Languages

class FrenchTests: XCTestCase {
    var decoder: JSONDecoder!

    override func setUp() {
        decoder = JSONDecoder()
    }

    func testThatItIsDecodable() {
        let fr = Loaders.load(type: French.self, resource: "fr.json")
        XCTAssert(!fr.records.isEmpty)
    }
}
