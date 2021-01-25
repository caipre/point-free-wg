import SwiftUI

struct HomeView: View {
  @ObservedObject var store: Store<AppState>

  //  @State private var selection: Language = .en
  //  @State private var searchQuery: String = ""

  var body: some View {
    NavigationView {
      VStack {
        Picker("Language picker", selection: $store.value.currentLanguage) {
          ForEach(Language.allCases, id: \.self) { element in
            Text(element.rawValue)
          }
        }.pickerStyle(MenuPickerStyle())
          .background(Color.gray)
        TextField("Search", text: $store.value.search.query)
          .background(Color.gray)
        NavigationLink("today's word".localizedCapitalized, destination: WordDefinitionView())
        NavigationLink("Recently viewed".localizedCapitalized, destination: RecentsView())
        NavigationLink("Favorites".localizedCapitalized, destination: FavoritesView(store: store))
      }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    }
  }
}
