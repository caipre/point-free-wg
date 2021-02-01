import Combine
import Foundation

class Store<Value, Action>: ObservableObject {
  let reducer: (inout Value, Action) -> Void
  @Published var value: Value {
    didSet {
      print(value)
    }
  }

  init(initialValue: Value, reducer: @escaping (inout Value, Action) -> Void) {
    self.reducer = reducer
    self.value = initialValue
  }

  func send(_ action: Action) {
    self.reducer(&self.value, action)
  }
}
