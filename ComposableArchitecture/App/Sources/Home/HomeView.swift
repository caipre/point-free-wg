import SwiftUI

struct HomeView: View {
  @State private var selection: Language = .en
  @State private var searchQuery: String = ""

  var body: some View {
    VStack {
      Picker("Language picker", selection: $selection) {
        ForEach(Language.allCases, id: \.self) { element in
          Text(element.rawValue)
        }
      }.pickerStyle(MenuPickerStyle())
        .background(Color.gray)
      TextField("Search", text: $searchQuery)
        .background(Color.gray)
      Button("Today's word".localizedCapitalized) {}
      Button("Recently viewed".localizedCapitalized) {}
      Button("Favorites".localizedCapitalized) {}
    }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
  }
}
