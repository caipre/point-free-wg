import Foundation

class Loaders {
  private static let decoder = JSONDecoder()

  static func load<T: Decodable>(type: T.Type, resource: String) -> T {
    let url = Bundle.main.url(forResource: resource, withExtension: "lzfse")!
    let dataz = try! Data(contentsOf: url)
    let data = try! (dataz as NSData).decompressed(using: .lzfse)

    let decoded = try! decoder.decode(type, from: data as Data)
    return decoded
  }
}
