import Foundation

/// A protocol defining the requirements for a configurable object.
public protocol Configurable: AnyObject {
    associatedtype ViewModel = BaseCellViewModelImpl
    func configure(with viewModel: ViewModel)
}
