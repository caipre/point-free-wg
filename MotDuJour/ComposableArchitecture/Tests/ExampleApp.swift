import ComposableArchitecture
import Foundation

struct AppState {
    var counter = Counter.State()
    var timer = Timer.State()
}

enum AppAction {
    case global
    case counter(Counter.Action)
    case timer(Timer.Action)
}

enum Counter {
    struct State {
        var value = 0
    }

    enum Action {
        case inc
        case dec
    }

    static let reducer: Reducer<State, Action> = { state, action in
        switch action {
        case .inc:
            state.value += 1
        case .dec:
            state.value -= 1
        }
    }
}

enum Timer {
    struct State {
        var value: Date?
    }

    enum Action {
        case start
        case stop
    }

    static let reducer: Reducer<State, Action> = { state, action in
        switch action {
        case .start:
            state.value = Date()
        case .stop:
            state.value = nil
        }
    }
}
