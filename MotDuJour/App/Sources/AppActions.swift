import HomeFeature

enum AppAction {
  case home(HomeFeature.HomeAction)
  case recents(RecentsAction)
  case favorites(FavoritesAction)
  case word(WordAction)
}

enum RecentsAction {
  case didTapWord
  case didTapClearAll
}

enum FavoritesAction {
  case didTapWord
  case didTapRemoveWord
}

enum WordAction {
  case didTapFavorite
  case didTapWord
}
