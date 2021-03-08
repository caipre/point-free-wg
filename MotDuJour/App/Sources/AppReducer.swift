import CasePaths
import ComposableArchitecture
import FavoritesFeature
import Foundation
import HomeFeature
import RecentsFeature

enum AppReducer {
    static let appReducer = ComposableArchitecture.combine(
        Pullback.pullback(
            reducer: HomeReducer.reducer,
            lens: \AppState.currentLanguage,
            prism: /AppAction.home
        ),
        Pullback.pullback(
            reducer: FavoritesFeature.reducer,
            lens: AppState.favoritesLens,
            prism: AppAction.favoritesPrism
        ),
        Pullback.pullback(
            reducer: RecentsFeature.reducer,
            lens: \AppState.recents,
            prism: /AppAction.recents
        )
    )
}
