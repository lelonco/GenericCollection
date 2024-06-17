import Combine
import UIKit

/// A protocol defining the requirements for a custom section view model.
protocol CustomSectionViewModelProtocol: SectionViewModel {
    associatedtype SectionType: SectionLayoutType
    var sectionType: SectionType { get set }
    init(sectionType: SectionType)
}

/// A generic class for a custom section view model.
open class CustomSectionViewModel<T: SectionLayoutType>: SectionViewModel, CustomSectionViewModelProtocol {
    public var sectionType: T

    public required init(sectionType: T) {
        self.sectionType = sectionType
        super.init()
        title = sectionType.title
    }

    override open func copy() -> SectionViewModel {
        Self(sectionType: sectionType)
    }
}

/// A base class for a section view model.
open class SectionViewModel: Hashable, ObservableObject {
    private(set) var uuid = UUID()
    public var title: String?
    @Published public var items: [BaseCellViewModelImpl] = [] {
        didSet {
            objectWillChange.send()
        }
    }

    public var layout: NSCollectionLayoutSection?

    private init(uuid: UUID, title: String?, items: [BaseCellViewModelImpl]) {
        self.uuid = uuid
        self.title = title
        self.items = items
    }

    public init() {}

    // MARK: - Hashable

    public static func == (lhs: SectionViewModel, rhs: SectionViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }

    open func copy() -> SectionViewModel {
        SectionViewModel(uuid: uuid, title: title, items: items)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
