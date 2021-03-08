import Foundation

public class Loaders {
    private static let decoder = JSONDecoder()

    public static func load<T: Decodable>(type: T.Type, resource: String) -> T {
        let url = Bundle.module.url(forResource: resource, withExtension: "lzfse")!
        let dataz = try! Data(contentsOf: url)
        let data = try! (dataz as NSData).decompressed(using: .lzfse)

        let decoded = try! decoder.decode(type, from: data as Data)
        return decoded
    }
}
