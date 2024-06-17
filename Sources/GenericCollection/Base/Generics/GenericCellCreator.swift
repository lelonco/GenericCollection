import UIKit

/// A generic class responsible for creating and configuring cells of type `Cell` with view models of type `ViewModel`.
/// It conforms to the `CellCreator` protocol.
public class GenericCellCreator<Cell: BaseConfigurableCell, ViewModel: BaseCellViewModelImpl>: CellCreator where ViewModel == Cell.ViewModel {
    /// A weak reference to a base cell view model implementation.
    public weak var viewModel: BaseCellViewModelImpl?

    /// A closure for custom cell configuration.
    private var customConfiguration: ((Cell?) -> Void)?

    /// An instance responsible for registering cells in a collection view.
    private var cellRegistrator: GenericCellRegistrator<Cell>

    /// Initializes a new instance of the cell creator.
    public init() {
        cellRegistrator = GenericCellRegistrator<Cell>()
    }

    /// Dequeues and configures a reusable cell from the collection view at the specified index path.
    public func dequeueReusableCell(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell? {
        cellRegistrator.registerCells(in: collectionView)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier,
                                                      for: indexPath) as? Cell
        if let viewModel = viewModel as? ViewModel {
            cell?.configure(with: viewModel)
        }
        customConfiguration?(cell)
        return cell
    }

    /// Registers a custom configuration closure to be applied to cells.
    @discardableResult
    public func registerCustomConfiguration(config: @escaping ((Cell?) -> Void)) -> Self {
        customConfiguration = config
        return self
    }
}
