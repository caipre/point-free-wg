public typealias Reducer<Value, Action> = (inout Value, Action) -> Effect
public typealias Effect = () -> Void
public func combine<Value, Action>(_ reducers: Reducer<Value, Action>...) -> Reducer<Value, Action>
{
    return { value, action in
        let effects = reducers.map { $0(&value, action) }
        return {
            effects.forEach { $0() }
        }

    }
}
