import SwiftUI
import ComposableArchitecture

struct FavoritesView: View {
  @ObservedObject var store: Store<AppState, AppAction>

  var body: some View {
    List {
      ForEach(store.value.favorites[store.value.currentLanguage] ?? [], id: \.self) { item in
        Text(item)
      }
    }
  }
}
