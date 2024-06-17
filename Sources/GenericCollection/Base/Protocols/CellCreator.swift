import UIKit

/// A protocol defining the requirements for a cell creator.
public protocol CellCreator: AnyObject {
    var viewModel: BaseCellViewModelImpl? { get set }
    func dequeueReusableCell(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell?
}