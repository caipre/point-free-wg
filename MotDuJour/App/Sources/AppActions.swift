import HomeFeature
import FavoritesFeature

enum AppAction {
    case home(HomeAction)
    case recents(RecentsAction)
    case favorites(FavoritesAction)
    case word(WordAction)
}

enum RecentsAction {
    case didTapWord
    case didTapClearAll
}

enum WordAction {
    case didTapFavorite
    case didTapWord
}
