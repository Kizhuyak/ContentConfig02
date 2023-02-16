//
//  ViewController.swift
//  ContentConfig02
//
//  Created by David DeWolfe on 2/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    struct Item: Hashable {
        var name: String?
        var quantity: Int?
        var date: String?
        var notes: String?
        
        init(name: String?, quantity: Int?, date: String?, notes: String?) {
            self.name = name
            self.quantity = quantity
            self.date = date
            self.notes = notes
        }
    }
    
    private enum Section: Hashable {
        case main
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    private var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDatasource()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection?.horizontalSizeClass == .compact {
            regularWidthCell().setNeedsUpdateConfiguration()
        } else if previousTraitCollection?.horizontalSizeClass == .regular {
            compactWidthCell().setNeedsUpdateConfiguration()
        }
        configureDatasource()
    }
    
    private func configureHierarchy() {
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    func configureDatasource() {
        if self.traitCollection.horizontalSizeClass == .compact {
            registerDatasource(type: "compact")
        } else if self.traitCollection.horizontalSizeClass == .regular {
            registerDatasource(type: "regular")
        }
        
        func registerDatasource(type: String ) {
            if type == "compact" {
                let cellRegistration = UICollectionView.CellRegistration<compactWidthCell, Item> { (cell, IndexPath, item) in
                }
                dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
                    (collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? in
                    return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
                }
                
            } else {
                let cellRegistration = UICollectionView.CellRegistration<regularWidthCell, Item> { (cell, IndexPath, item) in
                }
                
                dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
                    (collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? in
                    return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
                }
            }
            
            let date = Date()
            let currentDateTime = date.formatted(date: .numeric, time: .shortened)
            let item1 = Item(name: "Item1", quantity: 1, date: currentDateTime, notes: "Item1 notes")
            let item2 = Item(name: "item2", quantity: 1, date: currentDateTime, notes: "Item2 notes")
            var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
            snapshot.appendSections([.main])
            snapshot.appendItems([item1,item2])
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }
}

class compactWidthCell: UICollectionViewCell {
    override func updateConfiguration(using state: UICellConfigurationState) {
        
        var content = compactConfiguration().updated(for: state)
        contentConfiguration = content
    }
}
    
class regularWidthCell: UICollectionViewCell {
    override func updateConfiguration(using state: UICellConfigurationState) {
        
        var content = regularConfiguration().updated(for: state)
        contentConfiguration = content
    }
}

