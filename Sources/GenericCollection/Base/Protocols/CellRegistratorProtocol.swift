import UIKit

/// A protocol defining the requirements for a cell registrator.
public protocol CellRegistratorProtocol {
    func registerCells(in collectionView: UICollectionView)
}
