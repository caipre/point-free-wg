import SwiftUI
import Models

public struct RecentsView: View {
    @State var words: [Word] = ["test", "test"]

    public init() {}

    public var body: some View {
        List(words, id: \.self) { element in
            Text(element)
        }
    }
}
