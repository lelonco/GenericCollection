import UIKit

/// A class responsible for registering cell types in a collection view.
public class GenericCellRegistrator<Cell: BaseConfigurableCell>: CellRegistratorProtocol {
    /// Initializes a new instance of the cell registrator.
    public init() {}

    /// Registers the cell type in the specified collection view.
    public func registerCells(in collectionView: UICollectionView) {
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }
}
