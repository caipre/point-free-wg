import CasePaths
import ComposableArchitecture
import FavoritesFeature
import Foundation
import HomeFeature
import Languages
import WordDefinitionFeature

enum AppReducer {
    static let composedReducer = ComposableArchitecture.combine(
        reducer,
        Pullback.pullback(
            reducer: HomeFeature.reducer,
            lens: \AppState.currentLanguage,
            prism: /AppAction.home
        ),
        Pullback.pullback(
            reducer: FavoritesFeature.reducer,
            lens: \AppState.favoritesState,
            prism: /AppAction.favorites
        ),
        Pullback.pullback(
            reducer: WordDefinitionFeature.reducer,
            lens: \AppState.wordState,
            prism: /AppAction.word
        )
    )

    static let opticsAppReducer = ComposableArchitecture.combine(
        Pullback.pullback(
            reducer: HomeFeature.reducer,
            lens: AppState.homeLens,
            prism: AppAction.homePrism
        ),
        Pullback.pullback(
            reducer: FavoritesFeature.reducer,
            lens: AppState.favoritesLens,
            prism: AppAction.favoritesPrism
        ),
        Pullback.pullback(
            reducer: WordDefinitionFeature.reducer,
            lens: AppState.wordLens,
            prism: AppAction.wordPrism
        )
    )
}

func reducer(value: inout AppState, action: AppAction) -> [Effect<AppAction>] {
    switch action {
    case .app(.didFinishLaunching):
        switch value.currentLanguage {
        case .fr:
            return [
                { callback in
                    let corpus = Loaders.load(type: Corpus.self, resource: "fr.json")
                    callback(.loaded(corpus))
                }
            ]
        case .en:
            return [
                { callback in
                    let corpus = Loaders.load(type: Corpus.self, resource: "en-US.json")
                    callback(.loaded(corpus))
                }
            ]
        case .jp:
            fatalError("unimplemented")
        }
    case .app(.willTerminate):
        let state = value
        return [
            { _ in
                let data = try! JSONEncoder().encode(state)
                let documentsUrl = FileManager.default.urls(
                    for: .documentDirectory,
                    in: .userDomainMask
                ).first!
                let favoritePrimesUrl = documentsUrl.appendingPathComponent("app-state.json")
                try! data.write(to: favoritePrimesUrl)
            }
        ]
    default:
        return []
    }
}
