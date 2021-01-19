import SwiftUI

struct HomeView: View {
  @State private var selection: Language = .en
  @State private var searchQuery: String = ""

  var body: some View {
    NavigationView {
      VStack {
        Picker("Language picker", selection: $selection) {
          ForEach(Language.allCases, id: \.self) { element in
            Text(element.rawValue)
          }
        }.pickerStyle(MenuPickerStyle())
          .background(Color.gray)
        TextField("Search", text: $searchQuery)
          .background(Color.gray)
        NavigationLink("today's word".localizedCapitalized, destination: EmptyView())
        NavigationLink("Recently viewed".localizedCapitalized, destination: RecentsView())
        NavigationLink("Favorites".localizedCapitalized, destination: EmptyView())
      }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    }
  }
}
