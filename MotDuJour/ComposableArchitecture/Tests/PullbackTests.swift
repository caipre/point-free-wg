import CasePaths
import XCTest

@testable import ComposableArchitecture

class PullbackTests: XCTestCase {
  func testThatItPrisms() {
    var state = AppState()
    let reducer = Pullback.pullback(
      reducer: Counter.reducer,
      lens: \AppState.counter,
      prism: /AppAction.counter
    )

    reducer(&state, AppAction.timer(.start))

    XCTAssert(state.counter.value == 0)
    XCTAssertNil(state.timer.value)
  }

  func testThatItLenses() {
    var state = AppState()
    let reducer = Pullback.pullback(
      reducer: Timer.reducer,
      lens: \AppState.timer,
      prism: /AppAction.timer
    )

    reducer(&state, AppAction.timer(.start))

    XCTAssert(state.counter.value == 0)
    XCTAssertNotNil(state.timer.value)
  }
}
