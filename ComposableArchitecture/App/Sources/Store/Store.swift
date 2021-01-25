import Combine
import Foundation

class Store<Value>: ObservableObject {
  @Published var value: Value {
    didSet {
      print(value)
    }
  }

  init(initialValue: Value) {
    self.value = initialValue
  }
}
