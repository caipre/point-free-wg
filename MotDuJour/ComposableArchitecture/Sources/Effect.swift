import Combine

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
