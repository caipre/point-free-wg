import SwiftUI
import Models

struct RecentsView: View {
    @State var words: [Word] = ["test", "test"]

    var body: some View {
        List(words, id: \.self) { element in
            Text(element)
        }
    }
}
