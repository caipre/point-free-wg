import ComposableArchitecture
import FavoritesFeature
import HomeFeature
import WordDefinitionFeature

enum AppAction {
    case home(HomeAction)
    case favorites(FavoritesAction)
    case word(WordAction)
}

// MARK: - Optics
extension AppAction {
    static let homePrism: Optics.Prism<AppAction, HomeAction> = Optics.Prism<AppAction, HomeAction>(
        extract: { appAction in
            if case let .home(action) = appAction {
                return action
            } else {
                return nil
            }
        },
        embed: { AppAction.home($0) }
    )

    static let favoritesPrism = Optics.Prism<AppAction, FavoritesAction>(
        extract: { appAction in
            if case let .favorites(action) = appAction {
                return action
            } else {
                return nil
            }
        },
        embed: { AppAction.favorites($0) }
    )

    static let wordPrism = Optics.Prism<AppAction, WordAction>(
        extract: { appAction in
            if case let .word(action) = appAction {
                return action
            } else {
                return nil
            }
        },
        embed: { AppAction.word($0) }
    )
}
