import SwiftUI
import WordDefinitionFeature

struct SearchView: View {
    let searcher: Searcher
    @State var query: String = ""
    @State var results: [Result] = []

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Word", text: $query)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: query) { query in
                            results = searcher.search(query: query)
                        }
                }.padding()

                Spacer()

                List(results, id: \.self) { result in
                    NavigationLink(result.word, destination: WordDefinitionView())
                }

                Spacer()
            }.navigationBarTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searcher: SearcherImpl())
    }
}
