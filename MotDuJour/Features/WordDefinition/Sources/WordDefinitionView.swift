import ComposableArchitecture
import Languages
import Models
import SwiftUI

public struct WordDefinitionView: View {
    @ObservedObject var store: Store<WordState, WordAction>

    public init(store: Store<WordState, WordAction>) {
        self.store = store
    }

    public var body: some View {
        VStack {
            HStack {
                Text("Word")
                Button("*") {
                    store.send(.didTapFavorite)
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
