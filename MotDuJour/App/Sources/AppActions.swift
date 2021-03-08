import FavoritesFeature
import HomeFeature
import RecentsFeature
import WordDefinitionFeature

enum AppAction {
    case home(HomeAction)
    case recents(RecentsAction)
    case favorites(FavoritesAction)
    case word(WordAction)
}
