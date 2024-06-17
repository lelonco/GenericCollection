import UIKit

/// A protocol defining the requirements for a configurable cell.
public protocol BaseConfigurableCell: UICollectionViewCell, Configurable, Reusable {
    associatedtype ViewModel

    var cellViewModel: ViewModel? { get set }

    func configure(with viewModel: ViewModel)
}
