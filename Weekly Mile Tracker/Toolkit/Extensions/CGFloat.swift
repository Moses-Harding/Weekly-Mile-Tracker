//
//  CGFloat.swift
//  Weekly Mile Tracker
//
//  Created by Moses Harding on 3/13/24.
//

import Foundation

extension CGFloat {
    
    func withoutZero() -> String {
        
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(self))"
        } else {
            return "\(self)"
        }
    }
}
