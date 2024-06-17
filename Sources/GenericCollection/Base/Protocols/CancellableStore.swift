import Combine


/// A protocol defining a store for Combine cancellables.
public protocol CancellableStore {
    var cancellable: Set<AnyCancellable> { get nonmutating set }
}