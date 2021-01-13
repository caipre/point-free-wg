import XCTest

@testable import App

class FrenchTests: XCTestCase {
  var decoder: JSONDecoder!

  override func setUp() {
    decoder = JSONDecoder()
  }

  func testThatItIsDecodable() {
    let url = Bundle.main.url(forResource: "fr.json", withExtension: "lzfse")!
    let dataz = try! Data(contentsOf: url)
    let data = try! (dataz as NSData).decompressed(using: .lzfse)

    let decoded = try! decoder.decode(French.self, from: data as Data)

    XCTAssert(!decoded.records.isEmpty)
  }
}
