//
//  Array.swift
//  Weekly Mile Tracker
//
//  Created by Moses Harding on 3/11/24.
//

import Foundation

extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
    
    mutating func appendIfUnique(_ element: Element) {

        if !self.contains(element) {
            self.append(element)
        }
    }
    
    mutating func combineIfUnique(_ elements: [Element]) {
        
        for element in elements {
            self.appendIfUnique(element)
        }
    }
}
