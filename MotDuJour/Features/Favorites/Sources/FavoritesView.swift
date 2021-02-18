import ComposableArchitecture
import SwiftUI

public struct FavoritesView: View {
    @ObservedObject var store: Store<FavoritesState, FavoritesAction>

    public init(_ store: Store<FavoritesState, FavoritesAction>) {
        self.store = store
    }

    public var body: some View {
        List {
            ForEach(store.value.favorites[store.value.language] ?? [], id: \.self) { item in
                Text(item)
            }
        }
    }
}
