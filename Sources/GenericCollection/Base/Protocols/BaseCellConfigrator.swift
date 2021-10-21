import UIKit

public protocol BaseCellConfigrator {
    var cellCreator: any CellCreator { get set }

    func createCell(in collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionViewCell?
}