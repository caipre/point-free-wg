public typealias Reducer<Value, Action> = (inout Value, Action) -> [Effect<Action>]
public func combine<Value, Action>(_ reducers: Reducer<Value, Action>...) -> Reducer<Value, Action>
{
    return { value, action in
        let effects = reducers.flatMap { $0(&value, action) }
        return effects
    }
}
