import CasePaths
import ComposableArchitecture
import Foundation
import HomeFeature

enum AppReducer {
    static let appReducer = ComposableArchitecture.combine(
        Pullback.pullback(
            reducer: HomeReducer.reducer,
            lens: \AppState.currentLanguage,
            prism: /AppAction.home
        )
    )
}
