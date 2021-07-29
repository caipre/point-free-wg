import Combine
import Foundation

public struct Effect<Action> {
    public let run: (@escaping (Action) -> Void) -> Void

    public init(run: @escaping (@escaping (Action) -> Void) -> Void) {
        self.run = run
    }

    public func map<B>(_ f: @escaping (Action) -> B) -> Effect<B> {
        return Effect<B> { callback in
            self.run { action in
                callback(f(action))
            }
        }
    }

    public func then<A2>(_ effect: Effect<A2>, queue: DispatchQueue = .main) -> Effect<(Action, A2)>
    {
        return Effect<(Action, A2)> { callback in
            let group = DispatchGroup()

            var a: Action!
            var b: A2!

            group.enter()
            self.run { action in
                a = action
                group.leave()
            }

            group.enter()
            effect.run { a2 in
                b = a2
                group.leave()
            }

            group.notify(queue: queue) {
                callback((a, b))
            }
        }
    }
}

extension Effect {
    public func receive(on queue: DispatchQueue) -> Effect {
        return Effect { callback in
            self.run { a in
                queue.async {
                    callback(a)
                }
            }
        }
    }
}

extension Effect {
    public static func print(message: String) -> Effect {
        return Effect { callback in
            Swift.print(message)
        }
    }

    public static func save() -> Effect {
        return Effect { callback in
            Swift.print("I'm saving!")
        }
    }

    public static func fetch() -> Effect {
        return Effect { callback in
            Swift.print("I'm fetching!")
        }
    }
}


public struct PublisherEffect<Output>: Publisher {
    public typealias Failure = Never

    let publisher: AnyPublisher<Output, Failure>

    public func receive<S>(subscriber: S)
    where S: Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
        self.publisher.receive(subscriber: subscriber)
    }
}

extension PublisherEffect {
    public static func fireAndForget(work: @escaping () -> Void) -> PublisherEffect {
        return Deferred { () -> Empty<Output, Never> in
            work()
            return Empty(completeImmediately: true)
        }.eraseToPublisherEffect()
    }
}

extension Publisher where Failure == Never {
    public func eraseToPublisherEffect() -> PublisherEffect<Output> {
        return PublisherEffect(publisher: self.eraseToAnyPublisher())
    }
}

extension Publisher where Output == Never, Failure == Never {
    public func fireAndForget<A>() -> PublisherEffect<A> {
        return self.map(absurd).eraseToPublisherEffect()
    }
}

private func absurd<A>(_ never: Never) -> A {}
