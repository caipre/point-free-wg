import Combine
import Foundation

public final class Store<Value, Action>: ObservableObject {
    private let reducer: Reducer<Value, Action>
    @Published public private(set) var value: Value

    public init(
        with initialValue: Value,
        reducer: @escaping Reducer<Value, Action>
    ) {
        self.reducer = reducer
        self.value = initialValue
    }

    public func send(_ action: Action) {
        let effects = self.reducer(&self.value, action)
        effects.forEach { effect in
            effect.run(self.send)
        }
    }

    public func view<LocalValue, LocalAction>(
        value toLocalValue: @escaping (Value) -> LocalValue,
        action toGlobalAction: @escaping (LocalAction) -> Action
    ) -> Store<LocalValue, LocalAction> {
        let localStore = Store<LocalValue, LocalAction>(
            with: toLocalValue(self.value),
            reducer: { (localValue, localAction) in
                self.send(toGlobalAction(localAction))
                localValue = toLocalValue(self.value)
                return []
            }
        )
        return localStore
    }
}
