import UIKit

/// A protocol defining the requirements for a section layout type.
public protocol SectionLayoutType {
    var layout: NSCollectionLayoutSection { get }
    var title: String? { get }
}
