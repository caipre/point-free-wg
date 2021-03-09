import CasePaths
import ComposableArchitecture
import FavoritesFeature
import Foundation
import HomeFeature
import RecentsFeature
import WordDefinitionFeature

enum AppReducer {
    static let appReducer = ComposableArchitecture.combine(
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
            reducer: RecentsFeature.reducer,
            lens: \AppState.recents,
            prism: /AppAction.recents
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
            reducer: RecentsFeature.reducer,
            lens: AppState.recentsLens,
            prism: AppAction.recentsPrism
        ),
        Pullback.pullback(
            reducer: WordDefinitionFeature.reducer,
            lens: AppState.wordLens,
            prism: AppAction.wordPrism
        )
    )
}
