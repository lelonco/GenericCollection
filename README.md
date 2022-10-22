# GenericCollection.swift Documentation

This Swift package contains a collection of classes and protocols designed to facilitate the creation and management of a generic, configurable collection view in iOS development using UIKit and Combine. It leverages Swift's generics and protocols to provide a flexible and reusable way to handle collection views with different cell types and view models.

## Overview

The file is structured into several key components:

- **Cell Creation and Registration**: Classes and protocols to create and register cells dynamically based on their types and view models.
- **Collection View Management**: Protocols and classes to manage collection views, including their layout, data source, and interaction handling.
- **View Models**: Protocols and classes for defining view models for cells and sections within the collection view.
- **Utility Protocols and Extensions**: Additional protocols and extensions to support reusability and configurability.

### Key Components

#### Cell Creation and Registration

- [`GenericCellCreator`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fyaroslav%2FGenericCollection%2FSources%2FGenericCollection%2FBase%2FGenerics%2FGenericCellCreator.swift%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A2%2C%22character%22%3A13%7D%5D "Sources/GenericCollection/Base/Generics/GenericCellCreator.swift"): A class that creates and configures cells of a specific type for a collection view. It uses a generic cell registrator to register cell types with the collection view.
- `GenericCellRegistrator`: A class responsible for registering a cell type with a collection view, ensuring that the collection view can dequeue cells of this type.

#### Collection View Management

- [`CollectionVCProtocol`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fyaroslav%2FGenericCollection%2FSources%2FGenericCollection%2FBase%2FGenerics%2FGenericCollectionView.swift%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A5%2C%22character%22%3A16%7D%5D "Sources/GenericCollection/Base/Generics/GenericCollectionView.swift"): A protocol defining the essential functions and properties a collection view controller should have, including setup for layout and data source.
- [`GenericCollectionViewController`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fyaroslav%2FGenericCollection%2FSources%2FGenericCollection%2FBase%2FGenerics%2FGenericCollectionView.swift%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A28%2C%22character%22%3A11%7D%5D "Sources/GenericCollection/Base/Generics/GenericCollectionView.swift"): An open class that implements [`CollectionVCProtocol`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fyaroslav%2FGenericCollection%2FSources%2FGenericCollection%2FBase%2FGenerics%2FGenericCollectionView.swift%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A5%2C%22character%22%3A16%7D%5D "Sources/GenericCollection/Base/Generics/GenericCollectionView.swift"), providing a base implementation for a collection view controller that can be subclassed to create specific collection view controllers.

#### View Models

- `BaseCellViewModelImpl`: A base class for cell view models, implementing common functionalities needed by all cell view models.
- `SectionViewModel`: A class representing a section within the collection view, holding a collection of cell view models.
- [`CustomSectionViewModel`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fyaroslav%2FGenericCollection%2FSources%2FGenericCollection%2FBase%2FViewModels%2FSectionViewModel.swift%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A9%2C%22character%22%3A11%7D%5D "Sources/GenericCollection/Base/ViewModels/SectionViewModel.swift"): A generic class extending `SectionViewModel` to support custom section types with specific layout and title.

#### Utility Protocols and Extensions

- `BaseConfigurableCell`: A protocol for cells that can be configured with a view model.
- `CellCreator`: A protocol for objects that can create cells for a collection view.
- `CancellableStore`: A protocol for objects that hold cancellable subscriptions, typically used with Combine.
- `Reusable`: A protocol and extension providing a default implementation for reusable identifiers for collection view cells.

### Usage

To use this system in your project:

1. **Define Cell and ViewModel Types**: Implement your cell types conforming to `BaseConfigurableCell` and view model types conforming to `BaseCellViewModelImpl`.
2. **Setup Collection View Controller**: Subclass [`GenericCollectionViewController`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fyaroslav%2FGenericCollection%2FSources%2FGenericCollection%2FBase%2FGenerics%2FGenericCollectionView.swift%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A28%2C%22character%22%3A11%7D%5D "Sources/GenericCollection/Base/Generics/GenericCollectionView.swift"), specifying your section view model type.
3. **Configure DataSource and Layout**: Override [`makeDatasource`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fyaroslav%2FGenericCollection%2FSources%2FGenericCollection%2FBase%2FGenerics%2FGenericCollectionView.swift%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A13%2C%22character%22%3A9%7D%5D "Sources/GenericCollection/Base/Generics/GenericCollectionView.swift") and [`setupLayout`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fyaroslav%2FGenericCollection%2FSources%2FGenericCollection%2FBase%2FGenerics%2FGenericCollectionView.swift%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A14%2C%22character%22%3A9%7D%5D "Sources/GenericCollection/Base/Generics/GenericCollectionView.swift") in your collection view controller subclass to configure the data source and layout of your collection view.
4. **Bind ViewModel**: Utilize the [`defaultBind`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22path%22%3A%22%2FUsers%2Fyaroslav%2FGenericCollection%2FSources%2FGenericCollection%2FBase%2FGenerics%2FGenericCollectionView.swift%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A17%2C%22character%22%3A9%7D%5D "Sources/GenericCollection/Base/Generics/GenericCollectionView.swift") method in your collection view controller to bind the view model's publisher to the collection view.

### Conclusion

This package provides a robust foundation for managing complex collection views in iOS applications. By abstracting away much of the boilerplate code associated with setting up collection views, it allows developers to focus on the specific requirements of their application's UI.
