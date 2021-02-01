import SwiftUI

struct FavoritesView: View {
  //  @State var words: [Word] = ["test", "test"]
  @ObservedObject var store: Store<AppState, AppAction>

  var body: some View {
    List {
      ForEach(store.value.favorites[store.value.currentLanguage] ?? [], id: \.self) { item in
        Text(item)
      }
    }
  }
}
