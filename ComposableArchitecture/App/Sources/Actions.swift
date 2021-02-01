enum AppAction {
  case home(HomeAction)
  case recents(RecentsAction)
  case favorites(FavoritesAction)
  case word(WordAction)
}

enum HomeAction {
  case didTapLanguage(language: Language)
  case didTapTodaysWord
  case didTapRecentlyViewed
  case didTapFavorites
  case didTapSearch
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
