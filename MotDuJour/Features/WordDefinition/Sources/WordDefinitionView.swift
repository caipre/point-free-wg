import SwiftUI
import Languages
import Models

public struct WordDefinitionView: View {
    public init() {}

    public var body: some View {
        VStack {
            HStack {
                Text("Word")
                Button("*") {
                    print("star me")
                }
            }
            Spacer()
            Text("definition")
            Spacer()
        }
    }
}


struct WordDefinitionViewModel {
    let word: Word
    let favorited: Bool
    let record: French.Record
}
