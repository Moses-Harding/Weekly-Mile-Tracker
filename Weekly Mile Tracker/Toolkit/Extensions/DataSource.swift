//
//  DataSource.swift
//  Weekly Mile Tracker
//
//  Created by Moses Harding on 3/11/24.
//

import Foundation
import UIKit

extension NSDiffableDataSourceSectionSnapshot {
    
    mutating func applyDifferences(newItems: [ItemIdentifierType]) {
        
        guard self.items != newItems else { return }
        
        let differences = newItems.difference(from: self.items)
        
        for difference in differences {
            switch difference {
            case let .insert(offset: offset, element: item, _):
                //print("Insert \(item) at position \(offset)")
                if self.items.isEmpty {
                    self.append([item])
                } else if offset == 0 {
                    self.insert([item], before: self.items[0])
                } else {
                    self.insert([item], after: self.items[offset - 1])
                }
            case let .remove(offset: _, element: item, _):
                // print("Remove \(item) at position \(offset)")
                self.delete([item])
            }
        }
    }
}

extension UICollectionViewDiffableDataSource {
    /// Reapplies the current snapshot to the data source, animating the differences.
    /// - Parameters:
    ///   - completion: A closure to be called on completion of reapplying the snapshot.
    func refresh(completion: (() -> Void)? = nil) {
        self.apply(self.snapshot(), animatingDifferences: true, completion: completion)
    }
}

extension NSDiffableDataSourceSnapshot {
    
    mutating func applyDifferences(newSections: [SectionIdentifierType]) {
        
        guard self.sectionIdentifiers != newSections else { return }

        let differences = newSections.difference(from: self.sectionIdentifiers)
        
        for difference in differences {
            switch difference {
            case let .insert(offset: offset, element: section, _):
                // print("Insert \(section) at position \(offset)")
                if self.sectionIdentifiers.isEmpty {
                    self.appendSections([section])
                } else if offset == 0 {
                    self.insertSections([section], beforeSection: self.sectionIdentifiers[0])
                } else {
                    self.insertSections([section], afterSection: self.sectionIdentifiers[offset - 1])
                }
            case let .remove(offset: _, element: section, _):
                // print("Remove \(section) at position \(offset)")
                self.deleteSections([section])
            }
        }
    }
}
