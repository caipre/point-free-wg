import CasePaths
import ComposableArchitecture
import Foundation
import HomeFeature

enum AppReducer {
    static let appReducer = ComposableArchitecture.combine(
        Pullback.pullback(
            reducer: HomeFeature.HomeReducer.reducer,
            lens: AppState.homeLens,
            prism: AppAction.homePrism
        )
    )
}
