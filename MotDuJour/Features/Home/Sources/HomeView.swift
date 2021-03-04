import ComposableArchitecture
import Models
import FavoritesFeature
import RecentsFeature
import WordDefinitionFeature
import SwiftUI

public struct HomeView: View {
    @ObservedObject var store: Store<HomeState, HomeAction>

    public init(store: Store<HomeState, HomeAction>) {
        self.store = store
    }

    @State private var selection: Language = .en
    @State private var searchQuery: String = ""

    public var body: some View {
        NavigationView {
            VStack {
                Picker("Language picker", selection: $selection) {
                    ForEach(Language.allCases, id: \.self) { element in
                        Text(element.rawValue)
                    }
                }.pickerStyle(MenuPickerStyle())
                    .background(Color.gray)
                    .onChange(of: selection) { selection in
                        store.send(.didTapLanguage(language: selection))
                    }
                TextField("Search", text: $searchQuery)
                    .background(Color.gray)
                    .onChange(of: searchQuery) { query in
                        store.send(.didTapSearch(query: query))
                    }
                        NavigationLink("today's word".localizedCapitalized, destination: WordDefinitionView())
                        NavigationLink("Recently viewed".localizedCapitalized, destination: RecentsView())
//                        NavigationLink("Favorites".localizedCapitalized, destination: FavoritesView(store: store))
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        }
    }
}
