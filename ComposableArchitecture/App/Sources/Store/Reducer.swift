import Foundation

enum Reducer {
  static func appReducer(value: inout AppState, action: AppAction) {
    switch action {
    case .home(_):
      break
    case .recents(_):
      break
    case .favorites(_):
      break
    case .word(_):
      break
    }
  }
}
