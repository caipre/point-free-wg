import SwiftUI

struct SearchView: View {
  let searcher: Searcher
  @State var query: String = ""
  @State var results: [Result] = []

  var body: some View {
    VStack {
      HStack {
        Image(systemName: "magnifyingglass")
        TextField("Word", text: $query)
          .autocapitalization(.none)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()
          .onChange(of: query) { query in
            results = searcher.search(query: query)
          }
      }.padding()

      Divider()

      let sortedResults =
        results
        .sorted(by: { (a, b) in a.score < b.score })
      List(sortedResults, id: \.self) { result in
        Text(result.word)
      }.padding()

      Spacer()
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(searcher: SearcherImpl())
  }
}
