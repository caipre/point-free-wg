import ComposableArchitecture
import FavoritesFeature
import Models
import SwiftUI
import WordDefinitionFeature

public struct HomeView: View {
    @ObservedObject var store: Store<HomeState, HomeAction>

    private let favoritesStore: Store<FavoritesState, FavoritesAction>

    public init(
        store: Store<HomeState, HomeAction>,
        favoritesStore: Store<FavoritesState, FavoritesAction>
    ) {
        self.store = store
        self.favoritesStore = favoritesStore
    }

    @State private var searchQuery: String = ""

    private var pickerBinding: Binding<Language> {
        Binding<Language>(
            get: { self.store.value.language },
            set: { language in self.store.send(.didTapLanguage(language: language)) }
        )
    }

    public var body: some View {
        NavigationView {
            VStack {
                Picker("Language picker", selection: pickerBinding) {
                    ForEach(Language.allCases, id: \.self) { element in
                        Text(element.rawValue)
                    }
                }.pickerStyle(MenuPickerStyle())
                    .background(Color.gray)
                TextField("Search", text: $searchQuery)
                    .background(Color.gray)
                    .onChange(of: searchQuery) { query in
                        store.send(.didTapSearch(query: query))
                    }
                NavigationLink(
                    "today's word".localizedCapitalized,
                    destination: WordDefinitionView()
                )
                NavigationLink(
                    "Favorites".localizedCapitalized,
                    destination: FavoritesView(favoritesStore)
                )
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        }
    }
}
