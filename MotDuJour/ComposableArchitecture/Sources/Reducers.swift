public typealias Reducer<Value, Action> = (inout Value, Action) -> Void

public func combine<Value, Action>(_ reducers: Reducer<Value, Action>...) -> (
    inout Value, Action
) -> Void {
    return { value, action in
        for reducer in reducers {
            reducer(&value, action)
        }
    }
}
