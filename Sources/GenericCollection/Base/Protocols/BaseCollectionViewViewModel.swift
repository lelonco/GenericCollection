import Combine
import UIKit

/// A protocol defining the base requirements for a collection view model.
public protocol BaseCollectionViewViewModel: CancellableStore, ObservableObject {
    var sectionPublisher: AnyPublisher<[SectionViewModel], Never> { get }

    func layoutType(for indexPath: IndexPath) -> NSCollectionLayoutSection?

    func willDisplayCell(with indexPath: IndexPath)

    func didSelect(at indexPath: IndexPath)
}
